//
//  JSONDecoderExtensionTests.swift
//  CodeToShowTests
//
//  Created by [ laďa ] HAVLÍK on 10.10.2023.
//  Copyright © 2023 LHBnO. All rights reserved.
//

import XCTest
@testable import CodeToShow

final class JSONDecoderExtensionTests: XCTestCase {

    struct TestModel: Codable {
        let net: Date
        let windowStart: Date
    }

    let jsonToTest = """
{
    "net": "2022-10-05T16:00:00Z",
    "window_start": "2022-10-05T16:00:00.000Z"
}
"""

    /// Page of the list with a launch in the shape of the Launch Library 2 API.
    let pageToTest = """
{
    "count": 2,
    "next": "https://lldev.thespacedevs.com/2.3.0/launches/previous/?limit=1&offset=1",
    "previous": null,
    "results": [
        {
            "id": "862b54e3-0000-0000-0000-000000000000",
            "name": "Falcon 9 Block 5 | Crew-12",
            "net": "2026-02-01T10:00:00Z",
            "status": { "id": 3, "name": "Launch Successful", "abbrev": "Success" },
            "image": { "image_url": "https://example.com/big.jpeg", "thumbnail_url": "https://example.com/small.jpeg" },
            "mission": { "name": "Crew-12", "type": "Human Exploration", "description": "Description" },
            "launch_service_provider": { "id": 121, "name": "SpaceX" },
            "rocket": {
                "id": 1,
                "configuration": { "id": 164, "name": "Falcon 9", "full_name": "Falcon 9 Block 5" },
                "spacecraft_stage": [
                    {
                        "launch_crew": [
                            {
                                "id": 5263,
                                "role": { "id": 1, "role": "Commander", "priority": 0 },
                                "astronaut": { "id": 1, "name": "Jessica Meir", "agency": { "name": "NASA" }, "image": null }
                            }
                        ]
                    }
                ]
            }
        },
        {
            "id": "f3a1a032-0000-0000-0000-000000000000",
            "name": "Placeholder launch",
            "net": null,
            "status": { "id": 2, "name": "To Be Determined" },
            "image": null,
            "mission": null,
            "rocket": null
        }
    ]
}
"""

    func testDecodingWithTestModel() throws {
        let decoder = JSONDecoder.launchLibraryDecoder()
        let data = try XCTUnwrap(jsonToTest.data(using: .utf8))

        let decodedTestObject = try decoder.decode(TestModel.self, from: data)

        XCTAssertFalse(decodedTestObject.net == Date(timeIntervalSince1970: 0))
        XCTAssertFalse(decodedTestObject.windowStart == Date(timeIntervalSince1970: 0))
        XCTAssertEqual(decodedTestObject.net, decodedTestObject.windowStart)
    }

    func testDecodingOfWrongDateThrows() throws {
        let decoder = JSONDecoder.launchLibraryDecoder()
        let data = try XCTUnwrap(#"{ "net": "yesterday", "window_start": "2022-10-05T16:00:00Z" }"#.data(using: .utf8))

        XCTAssertThrowsError(try decoder.decode(TestModel.self, from: data))
    }

    func testDecodingOfLaunchesPage() throws {
        let decoder = JSONDecoder.launchLibraryDecoder()
        let data = try XCTUnwrap(pageToTest.data(using: .utf8))

        let page = try decoder.decode(PageModel<LaunchModel>.self, from: data)

        XCTAssertEqual(page.count, 2)
        XCTAssertNotNil(page.next)
        XCTAssertEqual(page.results.count, 2)

        let launch = page.results[0]
        XCTAssertEqual(launch.name, "Falcon 9 Block 5 | Crew-12")
        XCTAssertNotNil(launch.net)
        XCTAssertEqual(launch.isSuccess, true)
        XCTAssertEqual(launch.image?.thumbnail, URL(string: "https://example.com/small.jpeg"))
        XCTAssertEqual(launch.rocket?.configuration.fullName, "Falcon 9 Block 5")
        XCTAssertEqual(launch.crew.count, 1)
        XCTAssertEqual(launch.crew.first?.role.role, "Commander")
        XCTAssertEqual(launch.crew.first?.astronaut.agency?.name, "NASA")

        let placeholder = page.results[1]
        XCTAssertNil(placeholder.net)
        XCTAssertNil(placeholder.isSuccess)
        XCTAssertTrue(placeholder.crew.isEmpty)
        XCTAssertNil(placeholder.rocket)
    }
}
