//
//  SortingEnumsTests.swift
//  CodeToShowTests
//
//  Created by [ laďa ] HAVLÍK on 10.10.2023.
//  Copyright © 2023 LHBnO. All rights reserved.
//

import Testing
@testable import CodeToShow

struct SortingEnumsTests {

    @Test func `Enum contains the necessary values`() {
        #expect(SortingEnum.nameAscending == SortingEnum.nameAscending)
        #expect(SortingEnum.nameDescending == SortingEnum.nameDescending)
        #expect(SortingEnum.dateAscending == SortingEnum.dateAscending)
        #expect(SortingEnum.dateDescending == SortingEnum.dateDescending)
        #expect(SortingEnum.allCases.count == 4)
    }
}
