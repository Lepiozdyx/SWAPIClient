//
//  Planets.swift
//  ParsingJSONApp
//
//  Created by Alex on 06.05.2023.
//

struct Planets: Decodable {
    let message: String
    let total_records: Int
    let total_pages: Int
    let next: String
    let results: [Planet]
}

struct Planet: Decodable {
    let uid: String
    let name: String
    let url: String
}
