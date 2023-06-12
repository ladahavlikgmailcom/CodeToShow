//
//  SortingEnum.swift
//  CodeToShow
//
//  Created by [ laďa ] HAVLÍK on 23.05.2023.
//  Copyright © 2023 LHBnO. All rights reserved.
//

import SwiftUI

/// Useable types of sorting data in application.
enum SortingEnum: String, CaseIterable {
    case nameAscending = "Name Asc"
    case nameDescending = "Name Desc"
    case flightNumberAscending = "Flight Number Asc"
    case flightNumberDescending = "Flight Number Desc"
    case dateAscending = "Date Asc"
    case dateDescending = "Date Desc"
}
