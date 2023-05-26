//
//  Height.swift
//  CodeToShow
//
//  Created by [ laďa ] HAVLÍK on 26.05.2023.
//  Copyright © 2023 LHBnO. All rights reserved.
//

import SwiftUI

typealias Diameter = Height

class Height: Codable {

    // MARK: - Structure

    let meters: Double
    let feet: Double

    // MARK: - Initializer

    init(meters: Double, feet: Double) {
        self.meters = meters
        self.feet = feet
    }
}
