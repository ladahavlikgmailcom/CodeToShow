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
        let searchSearchField = app.navigationBars["Missions"].searchFields["Search"]
        searchSearchField.tap()
        searchSearchField.typeText("Crew-5")
        // swiftlint:disable:next line_length
        let crew5Button = app.collectionViews/*@START_MENU_TOKEN@*/.buttons["Crew-5, Flight number 187, Date 5. 10. 2022, 16:00, Mission Success"]/*[[".cells.buttons[\"Crew-5, Flight number 187, Date 5. 10. 2022, 16:00, Mission Success\"]",".buttons[\"Crew-5, Flight number 187, Date 5. 10. 2022, 16:00, Mission Success\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        crew5Button.tap()

        let elementsQuery = XCUIApplication().scrollViews.otherElements
        elementsQuery.staticTexts["Crew-5"].tap()
        elementsQuery.staticTexts["Crew"].tap()
        elementsQuery.staticTexts["Commander"].tap()
        elementsQuery.staticTexts["Rocket"].tap()
        elementsQuery.staticTexts["Name, Falcon 9"].tap()

        app.navigationBars["_TtGC7SwiftUI32NavigationStackHosting"].buttons["Missions"].tap()

        searchSearchField.tap()
        searchSearchField.buttons["Clear text"].tap()
        searchSearchField.typeText("ABS-2A")
        // swiftlint:disable:next line_length
        let abs2aButton = app.collectionViews/*@START_MENU_TOKEN@*/.buttons["ABS-2A / Eutelsat 117W B, Flight number 31, Date 15. 6. 2016, 14:29, Mission Success"]/*[[".cells.buttons[\"ABS-2A \/ Eutelsat 117W B, Flight number 31, Date 15. 6. 2016, 14:29, Mission Success\"]",".buttons[\"ABS-2A \/ Eutelsat 117W B, Flight number 31, Date 15. 6. 2016, 14:29, Mission Success\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        abs2aButton.tap()

        elementsQuery.staticTexts["ABS-2A / Eutelsat 117W B"].tap()
        elementsQuery.staticTexts["Rocket"].tap()
        elementsQuery.staticTexts["Name, Falcon 9"].tap()
    }
}
