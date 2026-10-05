//
//  Networking.swift
//  CodeToShow
//
//  Created by [ laďa ] HAVLÍK on 10.10.2023.
//  Copyright © 2023 LHBnO. All rights reserved.
//

import SwiftUI

/// Part where application contact API.
struct Networking {

    /// Provide call to API by Request and return data or throw error.
    /// - Parameter urlRequest: Direction to API with created full information where are data to fetch.
    /// - Returns: Fetched data from asynchronous data task.
    /// - Throws: ``ErrorModel`` when the communication fails or the server answers with an error status.
    func callAPI(urlRequest: URLRequest) async throws(ErrorModel) -> Data {
        let data: Data
        let response: URLResponse
        do {
            (data, response) = try await URLSession.shared.data(for: urlRequest)
        } catch {
            throw ErrorModel(
                errorPicture: Image(systemName: "wifi.exclamationmark"),
                errorText: error.localizedDescription
            )
        }

        // The API limits count of requests (status 429), other error statuses mean a problem on the server.
        if let httpResponse = response as? HTTPURLResponse, !(200..<300).contains(httpResponse.statusCode) {
            throw ErrorModel(
                errorPicture: Image(systemName: "exclamationmark.icloud"),
                errorText: "Server answered with error status \(httpResponse.statusCode), try it later."
            )
        }
        return data
    }
}
