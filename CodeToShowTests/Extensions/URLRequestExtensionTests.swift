//
//  URLRequestExtensionTests.swift
//  CodeToShowTests
//
//  Created by [ laďa ] HAVLÍK on 10.10.2023.
//  Copyright © 2023 LHBnO. All rights reserved.
//

import Foundation
import Testing
@testable import CodeToShow

struct URLRequestExtensionTests {

    let exampleId: String = "LaunchUUID"

    @Test func `Request for previous launches is a GET`() throws {
        let urlRequest = try #require(URLRequest.createRequest(path: .previousLaunches))

        #expect(urlRequest.url != nil)
        #expect(urlRequest.httpMethod == "GET")
    }

    @Test func `Request for launch detail has the query`() throws {
        let urlRequest = try #require(
            URLRequest.createRequest(
                path: .launches,
                id: exampleId,
                queryItems: [URLQueryItem(name: "mode", value: "detailed")]
            )
        )

        #expect(urlRequest.url?.query == "mode=detailed")
        #expect(urlRequest.httpMethod == "GET")
    }
}
