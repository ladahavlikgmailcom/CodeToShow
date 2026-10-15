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

    /// Launch of the crewed mission, which is in the data of the Launch Library 2 API.
    private let crewLaunchName = "Falcon 9 Block 5 | Crew-13"

    var app: XCUIApplication = XCUIApplication()

    override func setUp() async throws {
        continueAfterFailure = false
        app = XCUIApplication.launchedForTesting()
    }

    func testLaunchesDetailView() throws {
        // The list is filled from the API.
        XCTAssertTrue(app.cells.firstMatch.waitForExistence(timeout: XCUIApplication.networkTimeout))

        let searchField = app.launchSearchField
        searchField.tap()
        searchField.typeText("Crew-13")

        let row = app.launchRow(named: crewLaunchName)
        XCTAssertTrue(row.waitForExistence(timeout: 10))
        // The list can still be updated by the search, tap only a row which is ready.
        XCTAssertTrue(row.isHittable)
        row.tap()

        // The header is shown from the list data.
        let elementsQuery = app.scrollViews.staticTexts
        XCTAssertTrue(elementsQuery[crewLaunchName].waitForExistence(timeout: 20))

        // The crew and the rocket come from the detail of the launch, which is loaded separately.
        XCTAssertTrue(elementsQuery["Crew"].waitForExistence(timeout: XCUIApplication.networkTimeout))
        XCTAssertTrue(elementsQuery["Rocket"].exists)
        XCTAssertTrue(elementsQuery["Company, SpaceX"].exists)

        // Back to the list, where the search is still applied.
        app.navigationBars.buttons["BackButton"].tap()
        XCTAssertTrue(app.launchRow(named: crewLaunchName).waitForExistence(timeout: 10))
    }
}
