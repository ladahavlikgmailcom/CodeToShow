//
//  LaunchModel.swift
//  CodeToShow
//
//  Created by [ laďa ] HAVLÍK on 10.10.2023.
//  Copyright © 2023 LHBnO. All rights reserved.
//

import Foundation

/// Data model of a launch for the Launch Library 2 API ("/2.3.0/launches/").
///
/// The model is trimmed to values which are shown in the application. The list endpoint
/// returns the basic values, the detail endpoint (`mode=detailed`) adds the mission description,
/// full rocket information and the crew. Values which are only in the detail are optional.
struct LaunchModel: Codable, Hashable, Sendable, Identifiable {

    // MARK: - Structure

    let id: String
    let name: String
    let net: Date?
    let status: LaunchStatus
    let image: LaunchImage?
    let mission: LaunchMission?
    let rocket: LaunchRocket?
    let launchServiceProvider: Agency?

    // MARK: - Computed values

    /// Result of the mission derived from the launch status. `nil` when the result is not known yet.
    var isSuccess: Bool? {
        switch status.id {
        case LaunchStatus.successID:
            true
        case LaunchStatus.failureID, LaunchStatus.partialFailureID:
            false
        default:
            nil
        }
    }

    /// Crew of all spacecraft on the launch.
    var crew: [CrewMember] {
        rocket?.spacecraftStage?.flatMap { $0.launchCrew ?? [] } ?? []
    }

    // MARK: - Hashable stubs

    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }

    // MARK: - Equatable stubs

    static func == (lhs: LaunchModel, rhs: LaunchModel) -> Bool {
        lhs.id == rhs.id
    }
}

// MARK: - Launch parts

/// Status of the launch (Success, Failure, To Be Determined, ...).
struct LaunchStatus: Codable, Hashable, Sendable {

    // IDs of statuses in Launch Library 2.
    static let successID = 3
    static let failureID = 4
    static let partialFailureID = 7

    let id: Int
    let name: String
}

/// Image with a thumbnail. Addresses are strings, so one broken address can't break decoding of the whole list.
struct LaunchImage: Codable, Hashable, Sendable {

    let imageUrl: String?
    let thumbnailUrl: String?

    var url: URL? { imageUrl.flatMap { URL(string: $0) } }
    var thumbnail: URL? { thumbnailUrl.flatMap { URL(string: $0) } ?? url }
}

/// Mission of the launch.
struct LaunchMission: Codable, Hashable, Sendable {

    let name: String
    let type: String?
    let description: String?
}

/// Rocket used for the launch.
struct LaunchRocket: Codable, Hashable, Sendable {

    let configuration: RocketConfiguration
    /// Only in the detail of the launch.
    let spacecraftStage: [SpacecraftStage]?
}

/// Description of the rocket type.
struct RocketConfiguration: Codable, Hashable, Sendable {

    let name: String
    let fullName: String?
    /// Only in the detail of the launch.
    let description: String?
    let manufacturer: Agency?
    let image: LaunchImage?
}

/// Space agency or a company.
struct Agency: Codable, Hashable, Sendable {

    let name: String
    /// Only in the detailed values.
    let country: [Country]?
}

/// Country of an agency.
struct Country: Codable, Hashable, Sendable {

    let name: String
}

/// Spacecraft part of the launch which carries the crew.
struct SpacecraftStage: Codable, Hashable, Sendable {

    let launchCrew: [CrewMember]?
}

/// One member of the crew with the role on the launch.
struct CrewMember: Codable, Hashable, Sendable, Identifiable {

    let id: Int
    let role: CrewRole
    let astronaut: Astronaut
}

/// Role of the crew member on the launch.
struct CrewRole: Codable, Hashable, Sendable {

    let role: String
}

/// Astronaut with the values shown on the detail.
struct Astronaut: Codable, Hashable, Sendable {

    let name: String
    let agency: Agency?
    let image: LaunchImage?
}

// MARK: - Mock data

extension LaunchModel {

    /// Data for previews.
    static func mock() -> LaunchModel {
        LaunchModel(
            id: "862b54e3-0000-0000-0000-000000000000",
            name: "Falcon 9 Block 5 | Crew-12",
            net: ISO8601DateFormatter().date(from: "2026-02-01T10:00:00Z"),
            status: LaunchStatus(id: LaunchStatus.successID, name: "Launch Successful"),
            image: nil,
            mission: LaunchMission(
                name: "Crew-12",
                type: "Human Exploration",
                description: "Mocked Detail String"
            ),
            rocket: LaunchRocket(
                configuration: RocketConfiguration(
                    name: "Falcon 9",
                    fullName: "Falcon 9 Block 5",
                    description: "Falcon 9 is a two-stage rocket designed and manufactured by SpaceX.",
                    manufacturer: Agency(name: "SpaceX", country: [Country(name: "United States of America")]),
                    image: nil
                ),
                spacecraftStage: [
                    SpacecraftStage(launchCrew: [
                        CrewMember(
                            id: 1,
                            role: CrewRole(role: "Commander"),
                            astronaut: Astronaut(name: "Jessica Meir", agency: Agency(name: "NASA", country: nil), image: nil)
                        ),
                        CrewMember(
                            id: 2,
                            role: CrewRole(role: "Pilot"),
                            astronaut: Astronaut(name: "Jack Hathaway", agency: Agency(name: "NASA", country: nil), image: nil)
                        )
                    ])
                ]
            ),
            launchServiceProvider: Agency(name: "SpaceX", country: nil)
        )
    }
}
