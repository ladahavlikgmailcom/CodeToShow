//
//  PageModel.swift
//  CodeToShow
//
//  Created by [ laďa ] HAVLÍK on 10.10.2023.
//  Copyright © 2023 LHBnO. All rights reserved.
//

import Foundation

/// One page of a list from the Launch Library 2 API.
struct PageModel<Element: Decodable>: Decodable {

    /// Count of all items on the server.
    let count: Int
    /// Address of the next page, `nil` on the last page.
    let next: URL?
    let results: [Element]
}

extension PageModel: Sendable where Element: Sendable {}
