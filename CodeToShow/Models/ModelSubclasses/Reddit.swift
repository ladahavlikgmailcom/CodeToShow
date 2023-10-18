//
//  Reddit.swift
//  CodeToShow
//
//  Created by [ laďa ] HAVLÍK on 10.10.2023.
//  Copyright © 2023 LHBnO. All rights reserved.
//

import SwiftUI

class Reddit: Codable {

    // MARK: - Structure

    let campaign: URL?
    let launch: URL?
    let media: URL?
    let recovery: URL?

    // MARK: - Initializer

    init(campaign: URL?, launch: URL?, media: URL?, recovery: URL?) {
        self.campaign = campaign
        self.launch = launch
        self.media = media
        self.recovery = recovery
    }
}
