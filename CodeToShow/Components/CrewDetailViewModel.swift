//
//  CrewDetailViewModel.swift
//  CodeToShow
//
//  Created by [ laďa ] HAVLÍK on 25.05.2023.
//  Copyright © 2023 LHBnO. All rights reserved.
//

import SwiftUI

class CrewDetailViewModel: ObservableObject {

    // MARK: - Published variables

    @Published var data: CrewModel?

    // MARK: - Local variables

    private var loader: ModelLoader = ModelLoader<CrewModel>(path: .crew)
    var crew: Crew

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
        loader.loadModel(id: crew.crew) { result in
            Task {
                await self.handleData(apiData: try result.get())
            }
        }
    }

    @MainActor private func handleData(apiData: CrewModel) {
        self.data = apiData
    }
}
