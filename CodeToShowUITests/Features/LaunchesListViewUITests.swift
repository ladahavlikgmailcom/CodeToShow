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

    var app: XCUIApplication = XCUIApplication()

    override func setUp() async throws {
        continueAfterFailure = false
        app.launch()
    }

    func testLaunchesListViewToAppearOnScreen() throws {
        let missionsNavigationBar = app.navigationBars["Mise"]
        missionsNavigationBar.searchFields["Hledat"].tap()
        missionsNavigationBar.buttons["Zrušit"].tap()
        missionsNavigationBar.images["Seřadit"].tap()
    }

    func testLaunchesListViewSearchCrew13() throws {
        searchCrew13()
    }

    func testLaunchesListViewNavigateToDetail() throws {
        searchCrew13()
        app.collectionViews.staticTexts["Falcon 9 Block 5 | Crew-13"].tap()
        app.scrollViews.otherElements.staticTexts["Falcon 9 Block 5 | Crew-13"].tap()
    }

    func searchCrew13() {
        let searchSearchField = app.navigationBars["Mise"].searchFields["Hledat"]
        searchSearchField.tap()
        searchSearchField.typeText("Crew-13")
    }
}
