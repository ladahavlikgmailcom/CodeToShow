//
//  Core.swift
//  CodeToShow
//
//  Created by [ laďa ] HAVLÍK on 10.10.2023.
//  Copyright © 2023 LHBnO. All rights reserved.
//

import SwiftUI

class Core: Codable {

    // MARK: - Structure

    let core: String?
    let flight: Int?
    let gridfins: Bool?
    let legs: Bool?
    let reused: Bool?
    let landingAttempt: Bool?
    let landingSuccess: Bool?
    let landingType: String?
    let landpad: String?

    // MARK: - Initializer

    // swiftlint:disable:next line_length
    init(core: String?, flight: Int?, gridfins: Bool?, legs: Bool?, reused: Bool?, landingAttempt: Bool?, landingSuccess: Bool?, landingType: String?, landpad: String?) {
        self.core = core
        self.flight = flight
        self.gridfins = gridfins
        self.legs = legs
        self.reused = reused
        self.landingAttempt = landingAttempt
        self.landingSuccess = landingSuccess
        self.landingType = landingType
        self.landpad = landpad
    }
}
