//
//  Failure.swift
//  CodeToShow
//
//  Created by [ laďa ] HAVLÍK on 10.10.2023.
//  Copyright © 2023 LHBnO. All rights reserved.
//

import SwiftUI

class Failure: Codable {

    // MARK: - Structure

    let time: Int
    let altitude: Int?
    let reason: String

    // MARK: - Initializer

    init(time: Int, altitude: Int?, reason: String) {
        self.time = time
        self.altitude = altitude
        self.reason = reason
    }
}
