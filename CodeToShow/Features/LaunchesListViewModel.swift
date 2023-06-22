//
//  LaunchesListViewModel.swift
//  CodeToShow
//
//  Created by [ laďa ] HAVLÍK on 23.05.2023.
//  Copyright © 2023 LHBnO. All rights reserved.
//

import SwiftUI
import Combine
import Observation

@Observable class LaunchesListViewModel: ObservableObject {

    // MARK: - Observed

    var dataModel: [StarlinkModel] = []
    var errorModel: ErrorModel? = nil
    var sortingByEnum: SortingEnum = .flightNumberDescending

    // MARK: - Local variables

    private var loader: ModelLoader = ModelLoader<[StarlinkModel]>(path: .launches)
    private var rawData: [StarlinkModel] = []

    @ObservationIgnored
    var searchText: String = "" {
        didSet {
            filterData()
        }
    }

    var observer: AnyCancellable? = nil

    // MARK: - Initializer

    init() {
        loadData()
    }

    // MARK: - Data functions

    func loadData() {
        observer = loader.loadModel()
            .receive(on: DispatchQueue.main)
            .sink { [weak self] completion in
                guard let self else { return }
                switch completion {
                case .failure(let error):
                    errorModel = error
                case .finished: break
                }
            } receiveValue: { [weak self] data in
                guard let self else { return }
                rawData = data
                filterData()
            }
        errorModel = nil
    }

    /// filter data to show by search text
    private func filterData() {
        if searchText.isEmpty {
            dataModel = rawData
        } else {
            dataModel = rawData.filter({ starlinkModel in
                starlinkModel.name.contains(searchText)
                ||
                "\(starlinkModel.flightNumber)".contains(searchText)
                ||
                "\(starlinkModel.dateUtc.formatted())".contains(searchText)
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
    private func sortingBy() -> (StarlinkModel, StarlinkModel) -> Bool {
        switch sortingByEnum {
        case .nameAscending:
            return { $0.name < $1.name }
        case .nameDescending:
            return { $0.name > $1.name }
        case .flightNumberAscending:
            return { $0.flightNumber < $1.flightNumber }
        case .flightNumberDescending:
            return { $0.flightNumber > $1.flightNumber }
        case .dateAscending:
            return { $0.dateUtc < $1.dateUtc }
        case .dateDescending:
            return { $0.dateUtc > $1.dateUtc }
        }
    }

    // MARK: - View functions

    var showError: Bool {
        errorModel != nil
    }
}
