//
//  Patch.swift
//  CodeToShow
//
//  Created by [ laďa ] HAVLÍK on 10.10.2023.
//  Copyright © 2023 LHBnO. All rights reserved.
//

import SwiftUI

class Patch: Codable {

    // MARK: - Structure

    let small: URL?
    let large: URL?

    // MARK: - Initializer

    init(small: URL?, large: URL?) {
        self.small = small
        self.large = large
    }
}
