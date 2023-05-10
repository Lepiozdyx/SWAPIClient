//
//  Planets.swift
//  ParsingJSONApp
//
//  Created by Alex on 06.05.2023.
//

struct Planets: Decodable {
    let message: String
    let result: PlanetsData
}

struct PlanetsData: Decodable {
    let properties: PlanetProperties
}

struct PlanetProperties: Decodable {
    let diameter: String
    let rotationPeriod: String
    let orbitalPeriod: String
    let gravity: String
    let population: String
    let climate: String
    let terrain: String
    let surfaceWater: String
    let created: String
    let edited: String
    let name: String
    let url: String
}
