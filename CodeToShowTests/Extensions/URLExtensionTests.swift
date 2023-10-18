//
//  URLExtensionTests.swift
//  CodeToShowTests
//
//  Created by [ laďa ] HAVLÍK on 10.10.2023.
//  Copyright © 2023 LHBnO. All rights reserved.
//

import XCTest
@testable import CodeToShow

final class URLExtensionTests: XCTestCase {

    let exampleId: String = "StarlinkUUIID"

    func testCreateLaunchesURL() throws {
        let url = URL.createURL(path: .launches)

        XCTAssertNotNil(url)

        if let url = url?.absoluteString {
            XCTAssertTrue(url.hasPrefix("https"))
            XCTAssertTrue(url.contains(ComponentPathsEnum.launches.rawValue))
            XCTAssertFalse(url.contains(ComponentPathsEnum.crew.rawValue))
            XCTAssertFalse(url.contains(ComponentPathsEnum.rockets.rawValue))
            XCTAssertFalse(url.hasSuffix(exampleId))
        }
    }

    func testCreateCrewURL() throws {
        let url = URL.createURL(path: .crew, id: exampleId)

        XCTAssertNotNil(url)

        if let url = url?.absoluteString {
            XCTAssertTrue(url.hasPrefix("https"))
            XCTAssertFalse(url.contains(ComponentPathsEnum.launches.rawValue))
            XCTAssertTrue(url.contains(ComponentPathsEnum.crew.rawValue))
            XCTAssertFalse(url.contains(ComponentPathsEnum.rockets.rawValue))
            XCTAssertTrue(url.hasSuffix(exampleId))
        }
    }

    func testCreateRocketURL() throws {
        let url = URL.createURL(path: .rockets, id: exampleId)

        XCTAssertNotNil(url)

        if let url = url?.absoluteString {
            XCTAssertTrue(url.hasPrefix("https"))
            XCTAssertFalse(url.contains(ComponentPathsEnum.launches.rawValue))
            XCTAssertFalse(url.contains(ComponentPathsEnum.crew.rawValue))
            XCTAssertTrue(url.contains(ComponentPathsEnum.rockets.rawValue))
            XCTAssertTrue(url.hasSuffix(exampleId))
        }
    }
}
