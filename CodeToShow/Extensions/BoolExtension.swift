//
//  BoolExtension.swift
//  CodeToShow
//
//  Created by [ laďa ] HAVLÍK on 25.05.2023.
//  Copyright © 2023 LHBnO. All rights reserved.
//

import SwiftUI

extension Bool? {

    /// create success string from nullable Bool value.
    func handleSuccess() -> String {
        var successText = "Not known"
        if let success = self {
            successText = success ? "Success" : "Failure"
        }
        return successText
    }
}
