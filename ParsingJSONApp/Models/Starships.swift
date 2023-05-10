//
//  Starships.swift
//  ParsingJSONApp
//
//  Created by Alex on 06.05.2023.
//

struct Starships: Decodable {
    let message: String
    let result: StarshipsData
}

struct StarshipsData: Decodable {
    let properties: StarshipProperties
}

struct StarshipProperties: Decodable {
    let model: String
    let starshipClass: String
    let manufacturer: String
    let costInCredits: String
    let length: String
    let crew: String
    let passengers: String
    let maxAtmospheringSpeed: String
    let hyperdriveRating: String
    let MGLT: String
    let cargoCapacity: String
    let consumables: String
    let created: String
    let edited: String
    let name: String
    let url: String
}
