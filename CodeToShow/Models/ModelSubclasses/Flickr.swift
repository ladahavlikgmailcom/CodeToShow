//
//  Flickr.swift
//  CodeToShow
//
//  Created by [ laďa ] HAVLÍK on 10.10.2023.
//  Copyright © 2023 LHBnO. All rights reserved.
//

import SwiftUI

class Flickr: Codable {

    // MARK: - Structure

    let small: [URL]
    let original: [URL]

    // MARK: - Initializer

    init(small: [URL], original: [URL]) {
        self.small = small
        self.original = original
    }
}
