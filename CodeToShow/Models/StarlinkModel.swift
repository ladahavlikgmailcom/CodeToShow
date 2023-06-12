//
//  StarlinkModel.swift
//  CodeToShow
//
//  Created by [ laďa ] HAVLÍK on 26.05.2023.
//  Copyright © 2023 LHBnO. All rights reserved.
//

import SwiftUI

/// Data model of Starlink launches. It's for "/v5/launches/" API.
class StarlinkModel: Codable, Hashable {

    // MARK: - Structure

    let fairings: Fairing?
    let links: Link
    let staticFireDateUtc: Date?
    let staticFireDateUnix: Date?
    let net: Bool
    let window: Int?
    let rocket: String
    let success: Bool?
    let failures: [Failure]
    let details: String?
    let crew: [Crew]
    let ships: [String]
    let capsules: [String]
    let payloads: [String]
    let launchpad: String
    let flightNumber: Int
    let name: String
    let dateUtc: Date
    let dateUnix: Date
    let dateLocal: Date
    let datePrecision: String
    let upcoming: Bool
    let cores: [Core]
    let autoUpdate: Bool
    let tbd: Bool
    let launchLibraryID: String?
    let id: String

    // MARK: - Initializer

    // swiftlint:disable:next line_length
    init(fairings: Fairing?, links: Link, staticFireDateUtc: Date?, staticFireDateUnix: Date?, net: Bool, window: Int?, rocket: String, success: Bool?, failures: [Failure], details: String?, crew: [Crew], ships: [String], capsules: [String], payloads: [String], launchpad: String, flightNumber: Int, name: String, dateUtc: Date, dateUnix: Date, dateLocal: Date, datePrecision: String, upcoming: Bool, cores: [Core], autoUpdate: Bool, tbd: Bool, launchLibraryID: String?, id: String) {
        self.fairings = fairings
        self.links = links
        self.staticFireDateUtc = staticFireDateUtc
        self.staticFireDateUnix = staticFireDateUnix
        self.net = net
        self.window = window
        self.rocket = rocket
        self.success = success
        self.failures = failures
        self.details = details
        self.crew = crew
        self.ships = ships
        self.capsules = capsules
        self.payloads = payloads
        self.launchpad = launchpad
        self.flightNumber = flightNumber
        self.name = name
        self.dateUtc = dateUtc
        self.dateUnix = dateUnix
        self.dateLocal = dateLocal
        self.datePrecision = datePrecision
        self.upcoming = upcoming
        self.cores = cores
        self.autoUpdate = autoUpdate
        self.tbd = tbd
        self.launchLibraryID = launchLibraryID
        self.id = id
    }

    // MARK: - Hashable stubs

    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }

    // MARK: - Equatable stubs

    static func == (lhs: StarlinkModel, rhs: StarlinkModel) -> Bool {
        lhs.id == rhs.id
    }

    // MARK: - Mock data

    // swiftlint:disable:next function_body_length
    public static func mock() -> StarlinkModel {
        StarlinkModel(
            fairings: nil,
            links:
                Link(
                    patch:
                        Patch(
                            small: URL(string: "https://images2.imgbox.com/eb/d8/D1Yywp0w_o.png"),
                            large: URL(string: "https://images2.imgbox.com/33/2e/k6VE4iYl_o.png")
                        ),
                    reddit:
                        Reddit(
                            campaign: nil,
                            // swiftlint:disable:next line_length
                            launch: URL(string: "https://www.reddit.com/r/spacex/comments/xvm76j/rspacex_crew5_launchcoast_docking_discussion_and/"),
                            media: nil,
                            recovery: nil
                        ),
                    flickr:
                        Flickr(
                            small: [],
                            original: []
                        ),
                    presskit: nil,
                    webcast: URL(string: "https://youtu.be/5EwW8ZkArL4"),
                    youtubeID: "5EwW8ZkArL4",
                    article: nil,
                    wikipedia: URL(string: "https://en.wikipedia.org/wiki/SpaceX_Crew-5")
                ),
            staticFireDateUtc: ISO8601DateFormatter().date(from: "2022-10-05T14:00:00+0000")!,
            staticFireDateUnix: nil,
            net: false,
            window: nil,
            rocket: "5e9d0d95eda69973a809d1ec",
            success: true,
            failures: [],
            details: "Mocked Datail String",
            crew: [
                Crew(crew: "62dd7196202306255024d13c", role: "Commander"),
                Crew(crew: "62dd71c9202306255024d13d", role: "Pilot"),
                Crew(crew: "62dd7210202306255024d13e", role: "Mission Specialist 1"),
                Crew(crew: "62dd7253202306255024d13f", role: "Mission Specialist 2")
            ],
            ships: [],
            capsules: ["617c05591bad2c661a6e2909"],
            payloads: ["62dd73ed202306255024d145"],
            launchpad: "5e9e4502f509094188566f88",
            flightNumber: 187,
            name: "Crew-5",
            dateUtc: ISO8601DateFormatter().date(from: "2022-10-05T14:00:00+0000")!,
            dateUnix: ISO8601DateFormatter().date(from: "2022-10-05T16:00:00+0000")!,
            dateLocal: ISO8601DateFormatter().date(from: "2022-10-05T16:00:00+0000")!,
            datePrecision: "hour",
            upcoming: false,
            cores: [
                Core(
                    core: "633d9da635a71d1d9c66797b",
                    flight: 1,
                    gridfins: true,
                    legs: true,
                    reused: false,
                    landingAttempt: true,
                    landingSuccess: true,
                    landingType: "ASDS",
                    landpad: "5e9e3033383ecbb9e534e7cc"
                )
            ],
            autoUpdate: true,
            tbd: false,
            launchLibraryID: "f33d5ece-e825-4cd8-809f-1d4c72a2e0d3",
            id: "62dd70d5202306255024d139"
        )
    }
}
