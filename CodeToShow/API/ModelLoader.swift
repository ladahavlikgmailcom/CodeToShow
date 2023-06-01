//
//  ModelLoader.swift
//  CodeToShow
//
//  Created by [ laďa ] HAVLÍK on 23.05.2023.
//  Copyright © 2023 LHBnO. All rights reserved.
//

import SwiftUI
import Combine

class ModelLoader<Model: Decodable> {

    // MARK: - Local Variables

    // Returning structure
    typealias FutureHandler = Future<Model, ErrorModel>

    // API Path
    var path: ComponentPathsEnum

    // MARK: - Initializer

    init(path: ComponentPathsEnum) {
        self.path = path
    }

    // MARK: - Load data

    /// load data from API
    func loadModel(id: String? = nil) -> FutureHandler {
        Future { [weak self] promise in
            guard let self, let urlRequest = URLRequest.createRequest(path: path, id: id) else {
                promise(
                    .failure(
                        ErrorModel(
                            errorPicture: Image(systemName: "questionmark.circle.fill"),
                            errorText: "Appear unexpected error in loading model."
                        )
                    )
                )
                return
            }

            Networking().callAPI(urlRequest: urlRequest) { [weak self] result in
                guard let self else { return }
                switch result {
                case .success(let data):
                    self.decodeData(data: data, promise: promise)
                case .failure(let errorModel):
                    promise(.failure(errorModel))
                }
            }
        }
    }

    // MARK: - Decoding data

    /// decode Data into application Model

    private func decodeData(data: Data, promise: (Result<Model, ErrorModel>) -> Void) {
        do {
            let model = try JSONDecoder.spaceXDecoder().decode(Model.self, from: data)
            promise(.success(model))
        } catch {
            promise(
                .failure(
                    ErrorModel(
                        errorPicture: Image(systemName: "exclamationmark.triangle.fill"),
                        errorText: "Error in decoding data."
                    )
                )
            )
        }
    }
}
