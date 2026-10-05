//
//  URLExtension.swift
//  CodeToShow
//
//  Created by [ laďa ] HAVLÍK on 10.10.2023.
//  Copyright © 2023 LHBnO. All rights reserved.
//

import Foundation

extension URL {

    /// Host of the Launch Library 2 API.
    ///
    /// The development server has no limit of requests, but the data are not up to date.
    /// For the production use change it to "ll.thespacedevs.com" (15 requests per hour without a key).
    static let apiHost = "lldev.thespacedevs.com"

    /// Create url for path and id if necessary.
    /// - Parameters:
    ///   - path: ComponentPath where to ask for data.
    ///   - id: Optional parameter for concrete item is asked.
    ///   - queryItems: Optional query parameters of the request.
    /// - Returns: Return URL Request with completed path to API
    static func createURL(path: ComponentPathsEnum, id: String? = nil, queryItems: [URLQueryItem] = []) -> URL? {
        // prepare path and optional id to request
        var pathString = path.rawValue
        if let id {
            pathString.append("\(id)/")
        }
        // prepare URL
        var components = URLComponents()
        components.scheme = "https"
        components.host = apiHost
        components.path = pathString
        components.queryItems = queryItems.isEmpty ? nil : queryItems
        // create request
        return components.url
    }
}
