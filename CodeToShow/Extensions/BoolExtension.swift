//
//  BoolExtension.swift
//  CodeToShow
//
//  Created by [ laďa ] HAVLÍK on 10.10.2023.
//  Copyright © 2023 LHBnO. All rights reserved.
//

import SwiftUI

extension Bool? {

    /// Create "success" string from nullable Bool value.
    func handleSuccess() -> String {
        var successText = "Not known".localized()
        if let success = self {
            successText = success ? "Success".localized() : "Failure".localized()
        }
        return successText
    }
}
