//
//  CompositeFairing.swift
//  CodeToShow
//
//  Created by [ laďa ] HAVLÍK on 26.05.2023.
//  Copyright © 2023 LHBnO. All rights reserved.
//

import SwiftUI

class CompositeFairing: Codable {

    // MARK: - Structure

    let height: Height
    let diameter: Diameter

    // MARK: - Initializer

    init(height: Height, diameter: Diameter) {
        self.height = height
        self.diameter = diameter
    }
}
