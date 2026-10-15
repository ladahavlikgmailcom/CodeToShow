//
//  XCUIApplicationLaunch.swift
//  CodeToShowUITests
//
//  Created by [ laďa ] HAVLÍK on 10.10.2023.
//  Copyright © 2023 LHBnO. All rights reserved.
//

import XCTest

extension XCUIApplication {

    /// Maximum time to wait for data from the Launch Library 2 API.
    static let networkTimeout: TimeInterval = 40

    /// Launch the application in English, so the tests don't depend on the language of the simulator.
    @MainActor
    static func launchedForTesting() -> XCUIApplication {
        // Other tests (the launch test) leave the device rotated, the tests expect the portrait layout.
        XCUIDevice.shared.orientation = .portrait
        let app = XCUIApplication()
        app.launchArguments += ["-AppleLanguages", "(en)", "-AppleLocale", "en_US"]
        app.launch()
        return app
    }

    /// Search field of the list of launches.
    var launchSearchField: XCUIElement {
        searchFields.firstMatch
    }

    /// Row of the list with the launch of the given name.
    /// - Parameter name: Name of the launch, for example "Falcon 9 Block 5 | Crew-13".
    func launchRow(named name: String) -> XCUIElement {
        cells.containing(.staticText, identifier: name).firstMatch
    }
}
