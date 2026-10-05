//
//  LaunchDetailViewUITests.swift
//  CodeToShowUITests
//
//  Created by [ laďa ] HAVLÍK on 10.10.2023.
//  Copyright © 2023 LHBnO. All rights reserved.
//

import XCTest

@MainActor
final class LaunchDetailViewUITests: XCTestCase {

    var app: XCUIApplication = XCUIApplication()

    override func setUp() async throws {
        continueAfterFailure = false
        app.launch()
    }

    func testLaunchesDetailView() throws {
        let searchSearchField = app.navigationBars["Mise"].searchFields["Hledat"]
        searchSearchField.tap()
        searchSearchField.typeText("Crew-13")
        app.collectionViews.staticTexts["Falcon 9 Block 5 | Crew-13"].tap()

        // The detail contains the crew and the rocket, they are loaded from the API.
        let elementsQuery = app.scrollViews.otherElements
        XCTAssertTrue(elementsQuery.staticTexts["Falcon 9 Block 5 | Crew-13"].waitForExistence(timeout: 10))
        XCTAssertTrue(elementsQuery.staticTexts["Posádka"].waitForExistence(timeout: 10))
        XCTAssertTrue(elementsQuery.staticTexts["Commander"].exists)
        XCTAssertTrue(elementsQuery.staticTexts["Raketa"].exists)
    }
}
