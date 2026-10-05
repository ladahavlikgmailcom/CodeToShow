//
//  LaunchDetailViewModel.swift
//  CodeToShow
//
//  Created by [ laďa ] HAVLÍK on 10.10.2023.
//  Copyright © 2023 LHBnO. All rights reserved.
//

import SwiftUI
import Observation

/// Loads the detail of a launch which contains the mission, the rocket and the crew.
@MainActor
@Observable class LaunchDetailViewModel {

    // MARK: - Observed

    /// Detailed launch, `nil` until the detail is loaded.
    var detail: LaunchModel?

    // MARK: - Local variables

    private let loader = ModelLoader<LaunchModel>(path: .launches)

    // MARK: - Data functions

    /// Load the detail of the launch. Failure is ignored, the view stays with values from the list.
    /// - Parameter id: Identifier of the launch.
    func loadDetail(id: String) async {
        guard detail == nil else { return }
        let loaded = try? await loader.loadModel(id: id, queryItems: [URLQueryItem(name: "mode", value: "detailed")])
        guard !Task.isCancelled else { return }
        detail = loaded
    }
}
