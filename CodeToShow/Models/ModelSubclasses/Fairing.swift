//
//  Fairing.swift
//  CodeToShow
//
//  Created by [ laďa ] HAVLÍK on 26.05.2023.
//  Copyright © 2023 LHBnO. All rights reserved.
//

import SwiftUI

class Fairing: Codable {

    // MARK: - Structure

    let reused: Bool?
    let recoveryAttempt: Bool?
    let recovered: Bool?
    let ships: [String]

    // MARK: - Initializer

    init(reused: Bool?, recoveryAttempt: Bool?, recovered: Bool?, ships: [String]) {
        self.reused = reused
        self.recoveryAttempt = recoveryAttempt
        self.recovered = recovered
        self.ships = ships
    }
}
