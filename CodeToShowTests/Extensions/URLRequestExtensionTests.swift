//
//  URLRequestExtensionTests.swift
//  CodeToShowTests
//
//  Created by [ laďa ] HAVLÍK on 25.05.2023.
//  Copyright © 2023 LHBnO. All rights reserved.
//

import XCTest
@testable import CodeToShow

final class URLRequestExtensionTests: XCTestCase {

    let exampleId: String = "StarlinkUUIID"

    func testCreateRequestLaunches() throws {
        let urlRequest = URLRequest.createRequest(path: .launches)

        XCTAssertNotNil(urlRequest)

        if let url = urlRequest?.url?.absoluteString {
            XCTAssertTrue(url.hasPrefix("https"))
            XCTAssertFalse(url.hasSuffix(exampleId))
        }
    }

    func testCreateRequestCrew() throws {
        let urlRequest = URLRequest.createRequest(path: .crew, id: exampleId)

        XCTAssertNotNil(urlRequest)

        if let url = urlRequest?.url?.absoluteString {
            XCTAssertTrue(url.hasPrefix("https"))
            XCTAssertTrue(url.hasSuffix(exampleId))
        }
    }

    func testCreateRequestRockets() throws {
        let urlRequest = URLRequest.createRequest(path: .rockets, id: exampleId)

        XCTAssertNotNil(urlRequest)

        if let url = urlRequest?.url?.absoluteString {
            XCTAssertTrue(url.hasPrefix("https"))
            XCTAssertTrue(url.hasSuffix(exampleId))
        }
    }
}
