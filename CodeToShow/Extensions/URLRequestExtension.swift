//
//  URLRequestExtension.swift
//  CodeToShow
//
//  Created by [ laďa ] HAVLÍK on 23.05.2023.
//  Copyright © 2023 LHBnO. All rights reserved.
//

import SwiftUI

extension URLRequest {

    /// Create url request for path and id if necessary
    static func createRequest(path: ComponentPathsEnum, id: String? = nil) -> URLRequest? {
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
        return URLRequest(url: url)
    }
}
