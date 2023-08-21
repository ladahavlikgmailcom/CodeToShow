//
//  LaunchesListViewUITests.swift
//  CodeToShowUITests
//
//  Created by [ laďa ] HAVLÍK on 26.05.2023.
//  Copyright © 2023 LHBnO. All rights reserved.
//

import XCTest

final class LaunchesListViewUITests: XCTestCase {

    var app: XCUIApplication = XCUIApplication()

    override func setUpWithError() throws {
        continueAfterFailure = false
        app.launch()
    }

    func testLaunchesListViewToAppearOnScreen() throws {
        let missionsNavigationBar = app.navigationBars["Mise"]
        missionsNavigationBar.searchFields["Hledat"].tap()
        missionsNavigationBar.buttons["Zrušit"].tap()
        missionsNavigationBar.images["Seřadit"].tap()
    }

    func testLaunchesListViewSearchCrew5() throws {
        searchCrew5()
    }

    func testLaunchesListViewNavigateToDetail() throws {
        searchCrew5()
        app.collectionViews.staticTexts["Crew-5"].tap()
        app.scrollViews.otherElements.staticTexts["Crew-5"].tap()
    }

    func searchCrew5() {
        let searchSearchField = app.navigationBars["Mise"].searchFields["Hledat"]
        searchSearchField.tap()
        searchSearchField.typeText("Crew-5")
    }
}
