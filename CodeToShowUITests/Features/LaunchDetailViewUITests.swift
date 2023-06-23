//
//  LaunchDetailViewUITests.swift
//  CodeToShowUITests
//
//  Created by [ laďa ] HAVLÍK on 26.05.2023.
//  Copyright © 2023 LHBnO. All rights reserved.
//

import XCTest

final class LaunchDetailViewUITests: XCTestCase {

    var app: XCUIApplication = XCUIApplication()

    override func setUpWithError() throws {
        continueAfterFailure = false
        app.launch()
    }

    func testLaunchesDetailView() throws {
        let searchSearchField = app.navigationBars["Mise"].searchFields["Hledat"]
        searchSearchField.tap()
        searchSearchField.typeText("Crew-5")
        app.collectionViews.staticTexts["Crew-5"].tap()

        let elementsQuery = XCUIApplication().scrollViews.otherElements
        elementsQuery.staticTexts["Crew-5"].tap()
        elementsQuery.staticTexts["Posádka"].tap()
        elementsQuery.staticTexts["Commander"].tap()
        elementsQuery.staticTexts["Raketa"].tap()
        elementsQuery.staticTexts["Jméno, Falcon 9"].tap()

        app.navigationBars["_TtGC7SwiftUI32NavigationStackHosting"].buttons["Mise"].tap()

        searchSearchField.tap()
        searchSearchField.buttons["Smazat text"].tap()
        searchSearchField.typeText("ABS-2A")
        app.collectionViews.staticTexts["ABS-2A / Eutelsat 117W B"].tap()

        elementsQuery.staticTexts["ABS-2A / Eutelsat 117W B"].tap()
        elementsQuery.staticTexts["Raketa"].tap()
        elementsQuery.staticTexts["Jméno, Falcon 9"].tap()
    }
}
