//
//  URLRequestExtension.swift
//  CodeToShow
//
//  Created by [ laďa ] HAVLÍK on 10.10.2023.
//  Copyright © 2023 LHBnO. All rights reserved.
//

import Foundation

extension URLRequest {

    /// Create url request for path and id if necessary.
    /// - Parameters:
    ///   - path: ComponentPath where to ask for data.
    ///   - id: Optional parameter for concrete item is asked.
    ///   - queryItems: Optional query parameters of the request.
    /// - Returns: Return URL Request with completed path to API
    static func createRequest(path: ComponentPathsEnum, id: String? = nil, queryItems: [URLQueryItem] = []) -> URLRequest? {
        guard let url = URL.createURL(path: path, id: id, queryItems: queryItems) else { return nil }
        return URLRequest(url: url)
    }
}
