//
//  SecondStage.swift
//  CodeToShow
//
//  Created by [ laďa ] HAVLÍK on 10.10.2023.
//  Copyright © 2023 LHBnO. All rights reserved.
//

import SwiftUI

class SecondStage: Codable {

    // MARK: - Structure

    let thrust: Thrust
    let payloads: Payload
    let reusable: Bool
    let engines: Int
    let fuelAmountTons: Int
    let burnTimeSec: Int

    // MARK: - Initializer

    init(thrust: Thrust, payloads: Payload, reusable: Bool, engines: Int, fuelAmountTons: Int, burnTimeSec: Int) {
        self.thrust = thrust
        self.payloads = payloads
        self.reusable = reusable
        self.engines = engines
        self.fuelAmountTons = fuelAmountTons
        self.burnTimeSec = burnTimeSec
    }
}
