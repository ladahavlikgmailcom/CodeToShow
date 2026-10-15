//
//  ComponentPathsEnumTests.swift
//  CodeToShowTests
//
//  Created by [ laďa ] HAVLÍK on 10.10.2023.
//  Copyright © 2023 LHBnO. All rights reserved.
//

import Testing
@testable import CodeToShow

struct ComponentPathsEnumTests {

    @Test func `Enum contains the necessary values`() {
        #expect(ComponentPathsEnum.launches == ComponentPathsEnum.launches)
        #expect(ComponentPathsEnum.previousLaunches == ComponentPathsEnum.previousLaunches)
    }

    @Test func `Paths have the expected values`() {
        #expect(ComponentPathsEnum.launches.rawValue == "/2.3.0/launches/")
        #expect(ComponentPathsEnum.previousLaunches.rawValue == "/2.3.0/launches/previous/")
    }
}
