//
//  Thrust.swift
//  CodeToShow
//
//  Created by [ laďa ] HAVLÍK on 10.10.2023.
//  Copyright © 2023 LHBnO. All rights reserved.
//

import SwiftUI

typealias ThrustSeaLevel = Thrust
typealias ThrustVacuum = Thrust

class Thrust: Codable {

    // MARK: - Structure

    let kN: Int
    let lbf: Int

    // MARK: - Initializer

    init(kN: Int, lbf: Int) {
        self.kN = kN
        self.lbf = lbf
    }
}
