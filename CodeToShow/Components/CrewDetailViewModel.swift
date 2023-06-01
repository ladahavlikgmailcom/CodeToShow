//
//  CrewDetailViewModel.swift
//  CodeToShow
//
//  Created by [ laďa ] HAVLÍK on 25.05.2023.
//  Copyright © 2023 LHBnO. All rights reserved.
//

import SwiftUI
import Combine

class CrewDetailViewModel: ObservableObject {

    // MARK: - Published variables

    @Published var data: CrewModel?

    // MARK: - Local variables

    private var loader: ModelLoader = ModelLoader<CrewModel>(path: .crew)
    var crew: Crew
    var observer: AnyCancellable?

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
