//
//  People.swift
//  ParsingJSONApp
//
//  Created by Alex on 05.05.2023.
//

struct People: Decodable {
    let message: String
    let total_records: Int
    let total_pages: Int
    let next: String
    let results: [Person]
}

struct Person: Decodable {
    let uid: String
    let name: String
    let url: String
}
