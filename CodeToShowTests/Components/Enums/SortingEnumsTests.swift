//
//  SortingEnumsTests.swift
//  CodeToShowTests
//
//  Created by [ laďa ] HAVLÍK on 10.10.2023.
//  Copyright © 2023 LHBnO. All rights reserved.
//

import XCTest
@testable import CodeToShow

final class SortingEnumsTests: XCTestCase {

    func testNeccessaryValuesInEnum() throws {
        XCTAssertEqual(SortingEnum.nameAscending, SortingEnum.nameAscending)
        XCTAssertEqual(SortingEnum.nameDescending, SortingEnum.nameDescending)
        XCTAssertEqual(SortingEnum.flightNumberAscending, SortingEnum.flightNumberAscending)
        XCTAssertEqual(SortingEnum.flightNumberDescending, SortingEnum.flightNumberDescending)
        XCTAssertEqual(SortingEnum.dateAscending, SortingEnum.dateAscending)
        XCTAssertEqual(SortingEnum.dateDescending, SortingEnum.dateDescending)
    }
}
