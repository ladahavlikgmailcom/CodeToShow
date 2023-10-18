//
//  PayloadWeight.swift
//  CodeToShow
//
//  Created by [ laďa ] HAVLÍK on 10.10.2023.
//  Copyright © 2023 LHBnO. All rights reserved.
//

import SwiftUI

class PayloadWeight: Codable {

    // MARK: - Structure

    let id: String
    let name: String
    let kg: Int
    let lb: Int

    // MARK: - Initializer

    init(id: String, name: String, kg: Int, lb: Int) {
        self.id = id
        self.name = name
        self.kg = kg
        self.lb = lb
    }
}
