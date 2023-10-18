//
//  FirstStage.swift
//  CodeToShow
//
//  Created by [ laďa ] HAVLÍK on 10.10.2023.
//  Copyright © 2023 LHBnO. All rights reserved.
//

import SwiftUI

class FirstStage: Codable {

    // MARK: - Structure

    let thrustSeaLevel: ThrustSeaLevel
    let thrustVacuum: ThrustVacuum
    let reusable: Bool
    let engines: Int
    let fuelAmountTons: Int
    let burnTimeSec: Int

    // MARK: - Initializer

    // swiftlint:disable:next line_length
    init(thrustSeaLevel: ThrustSeaLevel, thrustVacuum: ThrustVacuum, reusable: Bool, engines: Int, fuelAmountTons: Int, burnTimeSec: Int) {
        self.thrustSeaLevel = thrustSeaLevel
        self.thrustVacuum = thrustVacuum
        self.reusable = reusable
        self.engines = engines
        self.fuelAmountTons = fuelAmountTons
        self.burnTimeSec = burnTimeSec
    }
}
