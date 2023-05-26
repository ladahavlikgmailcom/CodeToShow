//
//  LaunchesListViewModel.swift
//  CodeToShow
//
//  Created by [ laďa ] HAVLÍK on 23.05.2023.
//  Copyright © 2023 LHBnO. All rights reserved.
//

import SwiftUI

class LaunchesListViewModel: ObservableObject {

    // MARK: - Published

    @Published var dataModel: [StarlinkModel] = []
    @Published var errorModel: ErrorModel?

    // MARK: - AppStorage

    @AppStorage("sortingByEnum") var sortingByEnum: SortingEnum = .flightNumberDescending

    // MARK: - Local variables

    private var loader: ModelLoader = ModelLoader<[StarlinkModel]>(path: .launches)
    private var rawData: [StarlinkModel] = []

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

    func loadData() {
        loader.loadModel { result in
            switch result {
            case .success(let starlinkModel):
                Task {
                    await self.processData(data: starlinkModel)
                }
            case .failure(let errorModel):
                Task {
                    await self.processError(error: errorModel)
                }
            }
        }
        errorModel = nil
    }

    @MainActor func processData(data: [StarlinkModel]) {
        rawData = data
        filterData()
    }

    @MainActor func processError(error: ErrorModel) {
        errorModel = error
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
