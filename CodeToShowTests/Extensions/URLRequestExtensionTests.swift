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

    let exampleId: String = "LaunchUUID"

    func testCreateRequestPreviousLaunches() throws {
        let urlRequest = URLRequest.createRequest(path: .previousLaunches)

        XCTAssertNotNil(urlRequest)
        XCTAssertNotNil(urlRequest?.url)
        XCTAssertEqual(urlRequest?.httpMethod, "GET")
    }

    func testCreateRequestLaunchDetail() throws {
        let urlRequest = URLRequest.createRequest(
            path: .launches,
            id: exampleId,
            queryItems: [URLQueryItem(name: "mode", value: "detailed")]
        )

        XCTAssertNotNil(urlRequest)
        XCTAssertEqual(urlRequest?.url?.query, "mode=detailed")
        XCTAssertEqual(urlRequest?.httpMethod, "GET")
    }
}
