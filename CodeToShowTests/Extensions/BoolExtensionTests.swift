//
//  BoolExtensionTests.swift
//  CodeToShowTests
//
//  Created by [ laďa ] HAVLÍK on 10.10.2023.
//  Copyright © 2023 LHBnO. All rights reserved.
//

import Testing
@testable import CodeToShow

struct BoolExtensionTests {

    @Test func `Missing value is not known`() {
        let testBool: Bool? = nil
        #expect(testBool.handleSuccess() == "Not known".localized())
    }

    @Test func `True is success`() {
        let testBool: Bool? = true
        #expect(testBool.handleSuccess() == "Success".localized())
    }

    @Test func `False is failure`() {
        let testBool: Bool? = false
        #expect(testBool.handleSuccess() == "Failure".localized())
    }
}
