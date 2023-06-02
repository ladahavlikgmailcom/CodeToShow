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
        guard let url = URL.createURL(path: path, id: id) else { return nil }
        return URLRequest(url: url)
    }
}
