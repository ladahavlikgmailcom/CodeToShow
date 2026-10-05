//
//  JSONDecoderExtension.swift
//  CodeToShow
//
//  Created by [ laďa ] HAVLÍK on 10.10.2023.
//  Copyright © 2023 LHBnO. All rights reserved.
//

import Foundation

extension JSONDecoder {

    /// Special decoder for the Launch Library 2 API.
    ///
    /// Keys are converted from snake_case to camelCase. Dates are in ISO 8601,
    /// with or without fractional seconds.
    static func launchLibraryDecoder() -> JSONDecoder {
        let decoder = JSONDecoder()

        // decoding from API names to camelCase
        decoder.keyDecodingStrategy = .convertFromSnakeCase

        // custom date decoding, API can return the date with or without fractional seconds
        decoder.dateDecodingStrategy = .custom { decoder in
            let container = try decoder.singleValueContainer()
            let dateString = try container.decode(String.self)

            if let date = try? Date(dateString, strategy: .iso8601) {
                return date
            }
            if let date = try? Date.ISO8601FormatStyle(includingFractionalSeconds: true).parse(dateString) {
                return date
            }
            throw DecodingError.dataCorruptedError(
                in: container,
                debugDescription: "Date string does not match the ISO 8601 format: \(dateString)"
            )
        }
        return decoder
    }
}
