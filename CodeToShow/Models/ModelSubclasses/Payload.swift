//
//  Payload.swift
//  CodeToShow
//
//  Created by [ laďa ] HAVLÍK on 10.10.2023.
//  Copyright © 2023 LHBnO. All rights reserved.
//

import SwiftUI

class Payload: Codable {

    // MARK: - Structure

    let compositeFairing: CompositeFairing
    let option1: String

    // MARK: - Initializer

    init(compositeFairing: CompositeFairing, option1: String) {
        self.compositeFairing = compositeFairing
        self.option1 = option1
    }
}
