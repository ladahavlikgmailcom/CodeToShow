//
//  URLExtension.swift
//  CodeToShow
//
//  Created by [ laďa ] HAVLÍK on 02.06.2023.
//  Copyright © 2023 LHBnO. All rights reserved.
//

import SwiftUI

extension URL {

    /// Create url for path and id if necessary
    static func createURL(path: ComponentPathsEnum, id: String? = nil) -> URL? {
        // prepare path and optional id to request
        var pathString = path.rawValue
        if let id {
            pathString.append(id)
        }
        // prepare URL
        var components = URLComponents()
        components.scheme = "https"
        components.host = "api.spacexdata.com"
        components.path = pathString
        // create request
        guard let componentsURL = components.string, let url = URL(string: componentsURL) else { return nil }
        return url
    }
}
