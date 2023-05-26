//
//  JSONDecoderExtensionTests.swift
//  CodeToShowTests
//
//  Created by [ laďa ] HAVLÍK on 25.05.2023.
//  Copyright © 2023 LHBnO. All rights reserved.
//

import XCTest
@testable import CodeToShow

final class JSONDecoderExtensionTests: XCTestCase {

    struct TestModel: Codable {
        let staticFireDateUtc: Date
        let staticFireDateUnix: Date
        let dateUtc: Date
        let dateUnix: Date
        let dateLocal: Date
    }

    let jsonToTest = """
{
    "static_fire_date_utc": "2006-03-17T00:00:00.000Z",
    "static_fire_date_unix": 1142553600,
    "date_utc": "2006-03-24T22:30:00.000Z",
    "date_unix": 1143239400,
    "date_local": "2006-03-25T10:30:00+12:00"
}
"""

    func testDecodingWithTestModel() throws {
        let decoder = JSONDecoder.spaceXDecoder()
        let data = jsonToTest.data(using: .utf8)!

        XCTAssertNoThrow(try decoder.decode(TestModel.self, from: data))

        let decodedTestObject = try decoder.decode(TestModel.self, from: data)

        XCTAssertNotNil(decodedTestObject)
        XCTAssertFalse(decodedTestObject.staticFireDateUtc == Date(timeIntervalSince1970: 0))
        XCTAssertFalse(decodedTestObject.staticFireDateUnix == Date(timeIntervalSince1970: 0))
        XCTAssertFalse(decodedTestObject.dateUtc == Date(timeIntervalSince1970: 0))
        XCTAssertFalse(decodedTestObject.dateUnix == Date(timeIntervalSince1970: 0))
        XCTAssertFalse(decodedTestObject.dateLocal == Date(timeIntervalSince1970: 0))
    }
}
