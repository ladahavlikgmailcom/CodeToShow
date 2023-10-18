//
//  LandingLeg.swift
//  CodeToShow
//
//  Created by [ laďa ] HAVLÍK on 10.10.2023.
//  Copyright © 2023 LHBnO. All rights reserved.
//

import SwiftUI

class LandingLeg: Codable {

    // MARK: - Structure

    let number: Int
    let material: String

    // MARK: - Initializer

    init(number: Int, material: String) {
        self.number = number
        self.material = material
    }
}
