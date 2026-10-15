//
//  URLExtensionTests.swift
//  CodeToShowTests
//
//  Created by [ laďa ] HAVLÍK on 10.10.2023.
//  Copyright © 2023 LHBnO. All rights reserved.
//

import Foundation
import Testing
@testable import CodeToShow

struct URLExtensionTests {

    let exampleId: String = "LaunchUUID"

    @Test func `Previous launches URL has the host and the path`() throws {
        let url = try #require(URL.createURL(path: .previousLaunches))
        let urlString = url.absoluteString

        #expect(urlString.hasPrefix("https://\(URL.apiHost)"))
        #expect(urlString.contains(ComponentPathsEnum.previousLaunches.rawValue))
        #expect(url.query == nil)
    }

    @Test func `Launch detail URL ends with the identifier`() throws {
        let url = try #require(URL.createURL(path: .launches, id: exampleId))
        let urlString = url.absoluteString

        #expect(urlString.hasPrefix("https"))
        #expect(urlString.contains(ComponentPathsEnum.launches.rawValue))
        #expect(!urlString.contains(ComponentPathsEnum.previousLaunches.rawValue))
        #expect(urlString.hasSuffix("\(exampleId)/"))
    }

    @Test func `URL contains query items`() throws {
        let url = try #require(
            URL.createURL(
                path: .launches,
                id: exampleId,
                queryItems: [URLQueryItem(name: "mode", value: "detailed")]
            )
        )

        #expect(url.query == "mode=detailed")
    }
}
