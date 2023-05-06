//
//  Starships.swift
//  ParsingJSONApp
//
//  Created by Alex on 06.05.2023.
//

struct Response: Decodable {
    let message: String
    let total_records: Int
    let total_pages: Int
    let next: String
    let results: [Object]
}

struct Object: Decodable {
    let uid: String
    let name: String
    let url: String
}
