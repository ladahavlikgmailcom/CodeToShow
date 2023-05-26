//
//  ComponentPathsEnumTests.swift
//  CodeToShowTests
//
//  Created by [ laďa ] HAVLÍK on 26.05.2023.
//  Copyright © 2023 LHBnO. All rights reserved.
//

import XCTest
@testable import CodeToShow

final class ComponentPathsEnumTests: XCTestCase {

    func testNeccessaryValuesInEnum() throws {
        XCTAssertEqual(ComponentPathsEnum.launches, ComponentPathsEnum.launches)
        XCTAssertEqual(ComponentPathsEnum.rockets, ComponentPathsEnum.rockets)
        XCTAssertEqual(ComponentPathsEnum.crew, ComponentPathsEnum.crew)
    }
}
