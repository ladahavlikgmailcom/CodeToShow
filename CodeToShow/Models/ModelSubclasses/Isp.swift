//
//  Isp.swift
//  CodeToShow
//
//  Created by [ laďa ] HAVLÍK on 10.10.2023.
//  Copyright © 2023 LHBnO. All rights reserved.
//

import SwiftUI

class Isp: Codable {

    // MARK: - Structure

    let seaLevel: Int
    let vacuum: Int

    // MARK: - Initializer

    init(seaLevel: Int, vacuum: Int) {
        self.seaLevel = seaLevel
        self.vacuum = vacuum
    }
}
