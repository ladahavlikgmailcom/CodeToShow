//
//  ErrorModel.swift
//  CodeToShow
//
//  Created by [ laďa ] HAVLÍK on 10.10.2023.
//  Copyright © 2023 LHBnO. All rights reserved.
//

import SwiftUI

///  Custom error model for application.
struct ErrorModel: Error {

    // MARK: - Structure

    let errorPicture: Image
    let errorText: String
}
