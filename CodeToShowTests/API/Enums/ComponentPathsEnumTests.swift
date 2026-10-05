//
//  ComponentPathsEnumTests.swift
//  CodeToShowTests
//
//  Created by [ laďa ] HAVLÍK on 10.10.2023.
//  Copyright © 2023 LHBnO. All rights reserved.
//

import XCTest
@testable import CodeToShow

final class ComponentPathsEnumTests: XCTestCase {

    func testNeccessaryValuesInEnum() throws {
        XCTAssertEqual(ComponentPathsEnum.launches, ComponentPathsEnum.launches)
        XCTAssertEqual(ComponentPathsEnum.previousLaunches, ComponentPathsEnum.previousLaunches)
    }

    func testPathsValues() throws {
        XCTAssertEqual(ComponentPathsEnum.launches.rawValue, "/2.3.0/launches/")
        XCTAssertEqual(ComponentPathsEnum.previousLaunches.rawValue, "/2.3.0/launches/previous/")
    }
}
