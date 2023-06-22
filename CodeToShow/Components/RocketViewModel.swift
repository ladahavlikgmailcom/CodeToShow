//
//  RocketsViewModel.swift
//  CodeToShow
//
//  Created by [ laďa ] HAVLÍK on 25.05.2023.
//  Copyright © 2023 LHBnO. All rights reserved.
//

import SwiftUI
import Combine
import Observation

@Observable class RocketViewModel {

    // MARK: - Published variables

    var data: RocketModel? = nil

    // MARK: - Local variables

    private var loader: ModelLoader = ModelLoader<RocketModel>(path: .rockets)
    @ObservationIgnored
    var id: String
    private var observer: AnyCancellable? = nil

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
        observer = loader.loadModel(id: id)
            .receive(on: DispatchQueue.main)
            .sink { _ in } receiveValue: { [weak self] data in
                guard let self else { return }
                self.data = data
            }
    }
}
