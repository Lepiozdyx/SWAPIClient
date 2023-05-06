//
//  Starships.swift
//  ParsingJSONApp
//
//  Created by Alex on 06.05.2023.
//

struct Starships: Decodable {
    let message: String
    let total_records: Int
    let total_pages: Int
    let next: String
    let results: [Starship]
}

struct Starship: Decodable {
    let uid: String
    let name: String
    let url: String
}
