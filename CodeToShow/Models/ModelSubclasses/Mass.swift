//
//  Mass.swift
//  CodeToShow
//
//  Created by [ laďa ] HAVLÍK on 26.05.2023.
//  Copyright © 2023 LHBnO. All rights reserved.
//

import SwiftUI

class Mass: Codable {

    // MARK: - Structure

    let kg: Double
    let lb: Double

    // MARK: - Initializer

    init(kg: Double, lb: Double) {
        self.kg = kg
        self.lb = lb
    }
}
