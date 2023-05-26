//
//  BoolExtensionTests.swift
//  CodeToShowTests
//
//  Created by [ laďa ] HAVLÍK on 25.05.2023.
//  Copyright © 2023 LHBnO. All rights reserved.
//

import XCTest
@testable import CodeToShow

final class BoolExtensionTests: XCTestCase {

    func testWithNull() throws {
        let testBool: Bool? = nil
        let valueString = testBool.handleSuccess()
        XCTAssertEqual(valueString, "Not known")
    }

    func testWithTrue() throws {
        let testBool: Bool? = true
        let valueString = testBool.handleSuccess()
        XCTAssertEqual(valueString, "Success")
    }

    func testWithFalse() throws {
        let testBool: Bool? = false
        let valueString = testBool.handleSuccess()
        XCTAssertEqual(valueString, "Failure")
    }
}
