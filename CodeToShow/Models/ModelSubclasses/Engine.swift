//
//  Engine.swift
//  CodeToShow
//
//  Created by [ laďa ] HAVLÍK on 10.10.2023.
//  Copyright © 2023 LHBnO. All rights reserved.
//

import SwiftUI

class Engine: Codable {

    // MARK: - Structure

    let isp: Isp
    let thrustSeaLevel: ThrustSeaLevel
    let thrustVacuum: ThrustVacuum
    let number: Int
    let type: String
    let version: String
    let layout: String
    let engineLossMax: Int
    let propellant1: String
    let propellant2: String
    let thrustToWeight: Double

    // MARK: - Initializer

    // swiftlint:disable:next line_length
    init(isp: Isp, thrustSeaLevel: ThrustSeaLevel, thrustVacuum: ThrustVacuum, number: Int, type: String, version: String, layout: String, engineLossMax: Int, propellant1: String, propellant2: String, thrustToWeight: Double) {
        self.isp = isp
        self.thrustSeaLevel = thrustSeaLevel
        self.thrustVacuum = thrustVacuum
        self.number = number
        self.type = type
        self.version = version
        self.layout = layout
        self.engineLossMax = engineLossMax
        self.propellant1 = propellant1
        self.propellant2 = propellant2
        self.thrustToWeight = thrustToWeight
    }
}
