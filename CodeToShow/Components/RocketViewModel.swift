//
//  RocketsViewModel.swift
//  CodeToShow
//
//  Created by [ laďa ] HAVLÍK on 25.05.2023.
//  Copyright © 2023 LHBnO. All rights reserved.
//

import SwiftUI

class RocketViewModel: ObservableObject {

    // MARK: - Published variables

    @Published var data: RocketModel?

    // MARK: - Local variables

    private var loader: ModelLoader = ModelLoader<RocketModel>(path: .rockets)
    var id: String

    // MARK: - Initializer

    init(id: String) {
        self.id = id
        loadData()
    }

    // preview initializer
    init(data: RocketModel) {
        self.id = ""
        self.data = data
    }

    // MARK: - Data functions

    private func loadData() {
        loader.loadModel(id: id) { result in
            Task {
                await self.handleData(apiData: try result.get())
            }
        }
    }

    @MainActor private func handleData(apiData: RocketModel) {
        self.data = apiData
    }
}
