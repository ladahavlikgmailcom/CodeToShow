//
//  CrewModel.swift
//  CodeToShow
//
//  Created by [ laďa ] HAVLÍK on 10.10.2023.
//  Copyright © 2023 LHBnO. All rights reserved.
//

import SwiftUI

/// Data model of Crew for "/v4/crew/" API.
class CrewModel: Codable {

    // MARK: - Structure

    let name: String
    let agency: String
    let image: URL
    let wikipedia: URL
    let launches: [String]
    let status: String
    let id: String

    // MARK: - Initializer

    init(name: String, agency: String, image: URL, wikipedia: URL, launches: [String], status: String, id: String) {
        self.name = name
        self.agency = agency
        self.image = image
        self.wikipedia = wikipedia
        self.launches = launches
        self.status = status
        self.id = id
    }

    // MARK: - Mock data

    public static func mock() -> CrewModel {
        CrewModel(
            name: "Nicole Aunapu Mann",
            agency: "NASA",
            image: URL(string: "https://i.imgur.com/EW93kmg.png")!,
            wikipedia: URL(string: "https://en.wikipedia.org/wiki/Nicole_Aunapu_Mann")!,
            launches: ["62dd70d5202306255024d139"],
            status: "active",
            id: "62dd7196202306255024d13c"
        )
    }
}
