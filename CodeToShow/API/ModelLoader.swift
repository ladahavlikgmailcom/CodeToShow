//
//  ModelLoader.swift
//  CodeToShow
//
//  Created by [ laďa ] HAVLÍK on 10.10.2023.
//  Copyright © 2023 LHBnO. All rights reserved.
//

import SwiftUI

/// Calling API and decode data in to desired model.
struct ModelLoader<Model: Decodable> {

    // MARK: - Local Variables

    // API Path
    var path: ComponentPathsEnum

    // MARK: - Initializer

    /// Create instance with path to data.
    /// - Parameter path: part of path for data request
    init(path: ComponentPathsEnum) {
        self.path = path
    }

    // MARK: - Load data

    /// Load data from API and decode them in to the model.
    /// - Parameters:
    ///   - id: Optional identifier of desired data.
    ///   - queryItems: Optional query parameters of the request.
    /// - Returns: Decoded model.
    /// - Throws: ``ErrorModel`` when the request, the communication or the decoding fails.
    func loadModel(id: String? = nil, queryItems: [URLQueryItem] = []) async throws(ErrorModel) -> Model {
        guard let urlRequest = URLRequest.createRequest(path: path, id: id, queryItems: queryItems) else {
            throw ErrorModel(
                errorPicture: Image(systemName: "questionmark.circle.fill"),
                errorText: "Appear unexpected error in loading model."
            )
        }
        return try await load(urlRequest: urlRequest)
    }

    /// Load data from a complete address, for example the next page of a list.
    /// - Parameter url: Complete address of the request.
    /// - Returns: Decoded model.
    /// - Throws: ``ErrorModel`` when the communication or the decoding fails.
    func loadModel(url: URL) async throws(ErrorModel) -> Model {
        try await load(urlRequest: URLRequest(url: url))
    }

    // MARK: - Private

    private func load(urlRequest: URLRequest) async throws(ErrorModel) -> Model {
        let data = try await Networking().callAPI(urlRequest: urlRequest)
        return try decodeData(data: data)
    }

    // MARK: - Decoding data

    /// Decode Data into application Model
    /// - Parameter data: Data fetched from API.
    /// - Returns: Decoded model.
    /// - Throws: ``ErrorModel`` when the data can not be decoded.
    private func decodeData(data: Data) throws(ErrorModel) -> Model {
        do {
            return try JSONDecoder.launchLibraryDecoder().decode(Model.self, from: data)
        } catch {
            throw ErrorModel(
                errorPicture: Image(systemName: "exclamationmark.triangle.fill"),
                errorText: "Error in decoding data."
            )
        }
    }
}
