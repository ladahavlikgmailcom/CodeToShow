//
//  Crew.swift
//  CodeToShow
//
//  Created by [ laďa ] HAVLÍK on 26.05.2023.
//  Copyright © 2023 LHBnO. All rights reserved.
//

import SwiftUI

class Crew: Codable {

    // MARK: - Structure

    let crew: String
    let role: String

    // MARK: - Initializer

    init(crew: String, role: String) {
        self.crew = crew
        self.role = role
    }
}
