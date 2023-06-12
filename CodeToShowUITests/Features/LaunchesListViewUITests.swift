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
        let missionsNavigationBar = app.navigationBars["Missions"]
        missionsNavigationBar.searchFields["Search"].tap()
        missionsNavigationBar.buttons["Cancel"].tap()
        missionsNavigationBar.buttons["Sort"].tap()
    }

    func testLaunchesListViewSearchCrew5() throws {
        searchCrew5()
    }

    func testLaunchesListViewNavigateToDetail() throws {
        searchCrew5()
        // swiftlint:disable:next line_length
        app.collectionViews/*@START_MENU_TOKEN@*/.buttons["Crew-5, Flight number 187, Date 5. 10. 2022, 16:00, Mission Success"]/*[[".cells.buttons[\"Crew-5, Flight number 187, Date 5. 10. 2022, 16:00, Mission Success\"]",".buttons[\"Crew-5, Flight number 187, Date 5. 10. 2022, 16:00, Mission Success\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        app.scrollViews.otherElements.staticTexts["Crew-5"].tap()
    }

    func searchCrew5() {
        let searchSearchField = app.navigationBars["Missions"].searchFields["Search"]
        searchSearchField.tap()
        searchSearchField.typeText("Crew-5")
    }
}
