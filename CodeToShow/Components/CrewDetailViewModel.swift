//
//  CrewDetailViewModel.swift
//  CodeToShow
//
//  Created by [ laďa ] HAVLÍK on 25.05.2023.
//  Copyright © 2023 LHBnO. All rights reserved.
//

import SwiftUI
import Combine
import Observation

@Observable class CrewDetailViewModel {

    // MARK: - Published variables

    var data: CrewModel? = nil

    @ObservationIgnored
    var crew: Crew

    // MARK: - Local variables

    private var loader: ModelLoader = ModelLoader<CrewModel>(path: .crew)
    private var observer: AnyCancellable? = nil

    // MARK: - Initializer

    init(crew: Crew) {
        self.crew = crew
        loadData()
    }

    // preview initializer
    init(data: CrewModel) {
        self.crew = Crew(crew: "", role: "Mock Role")
        self.data = data
    }

    // MARK: - Data functions

    private func loadData() {
        observer = loader.loadModel(id: crew.crew)
            .receive(on: DispatchQueue.main)
            .sink { _ in } receiveValue: { [weak self] data in
                guard let self else { return }
                self.data = data
            }
    }
}
