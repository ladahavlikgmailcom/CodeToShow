//
//  URLRequestExtensionTests.swift
//  CodeToShowTests
//
//  Created by [ laďa ] HAVLÍK on 10.10.2023.
//  Copyright © 2023 LHBnO. All rights reserved.
//

import XCTest
@testable import CodeToShow

final class URLRequestExtensionTests: XCTestCase {

    let exampleId: String = "StarlinkUUIID"

    func testCreateRequestLaunches() throws {
        let urlRequest = URLRequest.createRequest(path: .launches)

        XCTAssertNotNil(urlRequest)
        XCTAssertNotNil(urlRequest?.url)
        XCTAssertEqual(urlRequest?.httpMethod, "GET")
    }

    func testCreateRequestCrew() throws {
        let urlRequest = URLRequest.createRequest(path: .crew, id: exampleId)

        XCTAssertNotNil(urlRequest)
        XCTAssertNotNil(urlRequest?.url)
        XCTAssertEqual(urlRequest?.httpMethod, "GET")
    }

    func testCreateRequestRockets() throws {
        let urlRequest = URLRequest.createRequest(path: .rockets, id: exampleId)

        XCTAssertNotNil(urlRequest)
        XCTAssertNotNil(urlRequest?.url)
        XCTAssertEqual(urlRequest?.httpMethod, "GET")
    }
}
