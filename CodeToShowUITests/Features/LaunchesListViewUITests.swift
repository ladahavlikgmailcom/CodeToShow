//
//  LaunchesListViewUITests.swift
//  CodeToShowUITests
//
//  Created by [ laďa ] HAVLÍK on 10.10.2023.
//  Copyright © 2023 LHBnO. All rights reserved.
//

import XCTest

@MainActor
final class LaunchesListViewUITests: XCTestCase {

    /// Launch of the crewed mission, which is in the data of the Launch Library 2 API.
    private let crewLaunchName = "Falcon 9 Block 5 | Crew-13"

    var app: XCUIApplication = XCUIApplication()

    override func setUp() async throws {
        continueAfterFailure = false
        app = XCUIApplication.launchedForTesting()
    }

    func testLaunchesListViewToAppearOnScreen() throws {
        XCTAssertTrue(app.navigationBars["Missions"].waitForExistence(timeout: 10))
        // The list is filled from the API.
        XCTAssertTrue(app.cells.firstMatch.waitForExistence(timeout: XCUIApplication.networkTimeout))

        app.navigationBars["Missions"].buttons["Sort"].tap()
        XCTAssertTrue(app.buttons["Name Asc"].waitForExistence(timeout: 5))
        XCTAssertTrue(app.buttons["Date Desc"].exists)
    }

    func testLaunchesListViewSearchCrew13() throws {
        searchCrew13()

        XCTAssertTrue(app.launchRow(named: crewLaunchName).waitForExistence(timeout: 10))
    }

    func testLaunchesListViewNavigateToDetail() throws {
        searchCrew13()
        let row = app.launchRow(named: crewLaunchName)
        XCTAssertTrue(row.waitForExistence(timeout: 10))
        // The list can still be updated by the search, tap only a row which is ready.
        XCTAssertTrue(row.isHittable)
        row.tap()

        XCTAssertTrue(app.scrollViews.staticTexts[crewLaunchName].waitForExistence(timeout: 20))
    }

    func searchCrew13() {
        XCTAssertTrue(app.cells.firstMatch.waitForExistence(timeout: XCUIApplication.networkTimeout))
        let searchField = app.launchSearchField
        searchField.tap()
        searchField.typeText("Crew-13")
    }
}
