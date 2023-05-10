//
//  People.swift
//  ParsingJSONApp
//
//  Created by Alex on 06.05.2023.
//

struct People: Decodable {
    let message: String
    let result: PeopleData
}

struct PeopleData: Decodable {
    let properties: PersonProperties
}

struct PersonProperties: Decodable {
    let height: String
    let mass: String
    let hairColor: String
    let skinColor: String
    let eyeColor: String
    let birthYear: String
    let gender: String
    let created: String
    let edited: String
    let name: String
    let homeworld: String
    let url: String
}
