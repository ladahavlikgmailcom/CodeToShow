//
//  LaunchesListViewModel.swift
//  CodeToShow
//
//  Created by [ laďa ] HAVLÍK on 10.10.2023.
//  Copyright © 2023 LHBnO. All rights reserved.
//

import SwiftUI
import Observation

@MainActor
@Observable class LaunchesListViewModel {

    // MARK: - Observed

    var dataModel: [LaunchModel] = []
    var errorModel: ErrorModel? = nil
    var sortingByEnum: SortingEnum = .dateDescending

    // MARK: - Local variables

    private let loader = ModelLoader<PageModel<LaunchModel>>(path: .previousLaunches)
    private var rawData: [LaunchModel] = []

    /// Address of the next page of the list, `nil` when everything is loaded.
    private var nextPage: URL?

    @ObservationIgnored
    private var loadTask: Task<Void, Never>?
    @ObservationIgnored
    private var loadMoreTask: Task<Void, Never>?

    @ObservationIgnored
    var searchText: String = "" {
        didSet {
            filterData()
        }
    }

    // MARK: - Initializer

    init() {
        loadData()
    }

    // MARK: - Data functions

    /// Count of launches in one page of the list. The maximum of the API is 100.
    private static let pageSize = 100

    func loadData() {
        errorModel = nil
        loadMoreTask?.cancel()
        loadTask?.cancel()
        loadTask = Task { [weak self, loader] in
            do throws(ErrorModel) {
                let page = try await loader.loadModel(queryItems: [
                    URLQueryItem(name: "mode", value: "normal"),
                    URLQueryItem(name: "ordering", value: "-net"),
                    URLQueryItem(name: "limit", value: "\(Self.pageSize)")
                ])
                guard let self, !Task.isCancelled else { return }
                rawData = page.results
                nextPage = page.next
                filterData()
            } catch {
                guard let self, !Task.isCancelled else { return }
                errorModel = error
            }
        }
    }

    /// Load the next page when the last launch of the list appears on the screen.
    /// - Parameter item: Launch which appeared on the screen.
    func loadMoreIfNeeded(current item: LaunchModel) {
        guard let nextPage, loadMoreTask == nil, item.id == dataModel.last?.id else { return }
        loadMoreTask = Task { [weak self, loader] in
            // A failure is ignored, the next page is tried again when the list is scrolled to the end again.
            let page = try? await loader.loadModel(url: nextPage)
            guard let self else { return }
            loadMoreTask = nil
            guard let page, !Task.isCancelled else { return }
            let knownIDs = Set(rawData.map(\.id))
            rawData += page.results.filter { !knownIDs.contains($0.id) }
            self.nextPage = page.next
            filterData()
        }
    }

    /// filter data to show by search text
    private func filterData() {
        if searchText.isEmpty {
            dataModel = rawData
        } else {
            dataModel = rawData.filter({ launch in
                launch.name.localizedStandardContains(searchText)
                ||
                "\(launch.net?.formatted() ?? "")".contains(searchText)
            })
        }
        sortData()
    }

    /// sort data to show and store choosen Sorting enum
    func sortData(sortingEnum: SortingEnum? = nil) {
        if let sortingEnum {
            sortingByEnum = sortingEnum
        }
        dataModel.sort(by: sortingBy())
    }

    /// returns sorting function for .sort(by:)
    private func sortingBy() -> (LaunchModel, LaunchModel) -> Bool {
        switch sortingByEnum {
        case .nameAscending:
            return { $0.name < $1.name }
        case .nameDescending:
            return { $0.name > $1.name }
        case .dateAscending:
            return { ($0.net ?? .distantFuture) < ($1.net ?? .distantFuture) }
        case .dateDescending:
            return { ($0.net ?? .distantFuture) > ($1.net ?? .distantFuture) }
        }
    }

    // MARK: - View functions

    var showError: Bool {
        errorModel != nil
    }
}
