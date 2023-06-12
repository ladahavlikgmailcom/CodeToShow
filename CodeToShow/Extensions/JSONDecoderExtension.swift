//
//  JSONDecoderExtension.swift
//  CodeToShow
//
//  Created by [ laďa ] HAVLÍK on 23.05.2023.
//  Copyright © 2023 LHBnO. All rights reserved.
//

import Foundation

extension JSONDecoder {

    /// Special decoder for StarlinkModel
    ///
    /// In decoder is custom process for date values. In source data are three types of sources for Date type.
    static func spaceXDecoder() -> JSONDecoder {
        let decoder = JSONDecoder()

        // decoding from API names to camelCase
        decoder.keyDecodingStrategy = .convertFromSnakeCase

        // custom date decoding for types of dates on string
        decoder.dateDecodingStrategy = .custom({ decoder in
            let isoFormatter = ISO8601DateFormatter()
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.sss'Z'"

            let container = try decoder.singleValueContainer()
            if let dateString = try? container.decode(String.self) {
                // first try iso8601
                if let date = isoFormatter.date(from: dateString) {
                    return date
                }
                // second try if it's some date
                if let date = dateFormatter.date(from: dateString) {
                    return date
                }
            } else
            // if it's number try to cretate date like unix
            if let dateNumber = try? container.decode(Double.self) {
                return Date(timeIntervalSince1970: dateNumber)
            }
            // default data is on begining
            return Date(timeIntervalSince1970: 0)
        })
        return decoder
    }
}
