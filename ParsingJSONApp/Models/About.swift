//
//  About.swift
//  ParsingJSONApp
//
//  Created by Alex on 06.05.2023.
//

struct About: Decodable {
    let message: String
    let totalRecords: Int
    let totalPages: Int
    let next: String
    let results: [Essence]
}

struct Essence: Decodable {
    let uid: String
    let name: String
    let url: String
}
