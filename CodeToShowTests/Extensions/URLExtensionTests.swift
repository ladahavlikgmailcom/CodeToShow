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

    let exampleId: String = "LaunchUUID"

    func testCreatePreviousLaunchesURL() throws {
        let url = try XCTUnwrap(URL.createURL(path: .previousLaunches))
        let urlString = url.absoluteString

        XCTAssertTrue(urlString.hasPrefix("https://\(URL.apiHost)"))
        XCTAssertTrue(urlString.contains(ComponentPathsEnum.previousLaunches.rawValue))
        XCTAssertNil(url.query)
    }

    func testCreateLaunchDetailURL() throws {
        let url = try XCTUnwrap(URL.createURL(path: .launches, id: exampleId))
        let urlString = url.absoluteString

        XCTAssertTrue(urlString.hasPrefix("https"))
        XCTAssertTrue(urlString.contains(ComponentPathsEnum.launches.rawValue))
        XCTAssertFalse(urlString.contains(ComponentPathsEnum.previousLaunches.rawValue))
        XCTAssertTrue(urlString.hasSuffix("\(exampleId)/"))
    }

    func testCreateURLWithQueryItems() throws {
        let url = try XCTUnwrap(
            URL.createURL(
                path: .launches,
                id: exampleId,
                queryItems: [URLQueryItem(name: "mode", value: "detailed")]
            )
        )

        XCTAssertEqual(url.query, "mode=detailed")
    }
}
