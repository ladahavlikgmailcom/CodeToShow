//
//  ComponentPathsEnum.swift
//  CodeToShow
//
//  Created by [ laďa ] HAVLÍK on 10.10.2023.
//  Copyright © 2023 LHBnO. All rights reserved.
//

import Foundation

/// Set of usable paths in API
enum ComponentPathsEnum: String {
    /// Detail of a launch, the identifier of the launch is added to the path.
    case launches = "/2.3.0/launches/"
    /// List of launches which already happened.
    case previousLaunches = "/2.3.0/launches/previous/"
}
