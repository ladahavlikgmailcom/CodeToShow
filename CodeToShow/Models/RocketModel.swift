//
//  RocketModel.swift
//  CodeToShow
//
//  Created by [ laďa ] HAVLÍK on 23.05.2023.
//  Copyright © 2023 LHBnO. All rights reserved.
//

import Foundation

/// Data model of Rocket values. It's for "/v4/rockets/" API.
class RocketModel: Codable {

    // MARK: - Structure

    let height: Height
    let diameter: Diameter
    let mass: Mass
    let firstStage: FirstStage
    let secondStage: SecondStage
    let engines: Engine
    let landingLegs: LandingLeg
    let payloadWeights: [PayloadWeight]
    let flickrImages: [URL]
    let name: String
    let type: String
    let active: Bool
    let stages: Int
    let boosters: Int
    let costPerLaunch: Int
    let successRatePct: Int
    let firstFlight: String
    let country: String
    let company: String
    let wikipedia: URL
    let description: String
    let id: String

    // MARK: - Initializer

    // swiftlint:disable:next line_length
    init(height: Height, diameter: Diameter, mass: Mass, firstStage: FirstStage, secondStage: SecondStage, engines: Engine, landingLegs: LandingLeg, payloadWeights: [PayloadWeight], flickrImages: [URL], name: String, type: String, active: Bool, stages: Int, boosters: Int, costPerLaunch: Int, successRatePct: Int, firstFlight: String, country: String, company: String, wikipedia: URL, description: String, id: String) {
        self.height = height
        self.diameter = diameter
        self.mass = mass
        self.firstStage = firstStage
        self.secondStage = secondStage
        self.engines = engines
        self.landingLegs = landingLegs
        self.payloadWeights = payloadWeights
        self.flickrImages = flickrImages
        self.name = name
        self.type = type
        self.active = active
        self.stages = stages
        self.boosters = boosters
        self.costPerLaunch = costPerLaunch
        self.successRatePct = successRatePct
        self.firstFlight = firstFlight
        self.country = country
        self.company = company
        self.wikipedia = wikipedia
        self.description = description
        self.id = id
    }

    // MARK: - Mock data

    // swiftlint:disable:next function_body_length
    public static func mock() -> RocketModel {
        RocketModel(
            height: Height(meters: 70, feet: 229.6),
            diameter: Diameter(meters: 3.7, feet: 12),
            mass: Mass(kg: 549054, lb: 1207920),
            firstStage:
                FirstStage(
                    thrustSeaLevel: ThrustSeaLevel(kN: 7607, lbf: 1710000),
                    thrustVacuum: ThrustVacuum(kN: 8227, lbf: 1849500),
                    reusable: true,
                    engines: 9,
                    fuelAmountTons: 385,
                    burnTimeSec: 162
                ),
            secondStage:
                SecondStage(
                    thrust: Thrust(kN: 934, lbf: 210000),
                    payloads:
                        Payload(
                            compositeFairing:
                                CompositeFairing(
                                    height: Height(meters: 13.1, feet: 43),
                                    diameter: Diameter(meters: 5.2, feet: 17)
                                ),
                            option1: "dragon"
                        ),
                    reusable: false,
                    engines: 1,
                    fuelAmountTons: 90,
                    burnTimeSec: 397
                ),
            engines:
                Engine(
                    isp: Isp(seaLevel: 288, vacuum: 312),
                    thrustSeaLevel: ThrustSeaLevel(kN: 845, lbf: 190000),
                    thrustVacuum: ThrustVacuum(kN: 914, lbf: 205500),
                    number: 9,
                    type: "merlin",
                    version: "1D+",
                    layout: "octaweb",
                    engineLossMax: 2,
                    propellant1: "liquid oxygen",
                    propellant2: "RP-1 kerosene",
                    thrustToWeight: 180.1
                ),
            landingLegs: LandingLeg(number: 4, material: "carbon fiber"),
            payloadWeights: [
                PayloadWeight(id: "leo", name: "Low Earth Orbit", kg: 22800, lb: 50265),
                PayloadWeight(id: "gto", name: "Geosynchronous Transfer Orbit", kg: 8300, lb: 18300),
                PayloadWeight(id: "mars", name: "Mars Orbit", kg: 4020, lb: 8860)
            ],
            flickrImages: [
                URL(string: "https://farm1.staticflickr.com/929/28787338307_3453a11a77_b.jpg")!,
                URL(string: "https://farm4.staticflickr.com/3955/32915197674_eee74d81bb_b.jpg")!,
                URL(string: "https://farm1.staticflickr.com/293/32312415025_6841e30bf1_b.jpg")!,
                URL(string: "https://farm1.staticflickr.com/623/23660653516_5b6cb301d1_b.jpg")!,
                URL(string: "https://farm6.staticflickr.com/5518/31579784413_d853331601_b.jpg")!,
                URL(string: "https://farm1.staticflickr.com/745/32394687645_a9c54a34ef_b.jpg")!
            ],
            name: "Falcon 9",
            type: "rocket",
            active: true,
            stages: 2,
            boosters: 0,
            costPerLaunch: 50000000,
            successRatePct: 98,
            firstFlight: "2010-06-04",
            country: "United States",
            company: "SpaceX",
            wikipedia: URL(string: "https://en.wikipedia.org/wiki/Falcon_9")!,
            // swiftlint:disable:next line_length
            description: "Falcon 9 is a two-stage rocket designed and manufactured by SpaceX for the reliable and safe transport of satellites and the Dragon spacecraft into orbit.",
            id: "5e9d0d95eda69973a809d1ec"
        )
    }
}
