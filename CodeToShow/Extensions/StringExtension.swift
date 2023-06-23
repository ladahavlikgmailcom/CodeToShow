//
//  StringExtension.swift
//  CodeToShow
//
//  Created by [ laďa ] HAVLÍK on 23.06.2023.
//  Copyright © 2023 LHBnO. All rights reserved.
//

import SwiftUI

extension String {
    // localized string
    func localized() -> String {
        String(localized: String.LocalizationValue(stringLiteral: self), table: "Localizable")
    }
}
