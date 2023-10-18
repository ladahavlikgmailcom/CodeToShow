//
//  Networking.swift
//  CodeToShow
//
//  Created by [ laďa ] HAVLÍK on 10.10.2023.
//  Copyright © 2023 LHBnO. All rights reserved.
//

import SwiftUI

/// Part where application contact API.
class Networking {

    /// Provide call to API by Request and return data of error
    /// - Parameters:
    ///   - urlRequest: Direction to API with created full information where are data to fetch.
    ///   - result: Return fetched data or error from asynchronous data task.
    func callAPI(urlRequest: URLRequest, result: @escaping (Result<Data, ErrorModel>) -> Void) {
        URLSession.shared.dataTask(with: urlRequest) { (data, _, error) in
            if let error {
                result(
                    .failure(
                        ErrorModel(
                            errorPicture: Image(systemName: "wifi.exclamationmark"),
                            errorText: error.localizedDescription
                        )
                    )
                )
            } else if let data {
                result(.success(data))
            } else {
                result(
                    .failure(
                        ErrorModel(
                            errorPicture: Image(systemName: "questionmark.circle.fill"),
                            errorText: "Appear unexpected error in communication, try it later."
                        )
                    )
                )
            }
        }.resume()
    }
}
