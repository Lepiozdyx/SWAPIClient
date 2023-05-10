//
//  NetworkManager.swift
//  ParsingJSONApp
//
//  Created by Alex on 09.05.2023.
//

import Foundation

enum StarWars {
    enum People: String {
        case main = ""
        case luke = "1"
        case c3po = "2"
        case r2d2 = "3"
        case vader = "4"
        case leia = "5"
        case owenLars = "6"
        case beru = "7"
        case r5d4 = "8"
        case biggs = "9"
        case obiWan = "10"
    }
    enum Planets: String {
        case main = ""
        case tatooine = "1"
        case alderaan = "2"
        case yavinIV = "3"
        case hoth = "4"
        case dagobah = "5"
        case bespin = "6"
        case endor = "7"
        case naboo = "8"
        case coruscant = "9"
        case kamino = "10"
    }
    enum Starships: String {
        case main = ""
        case cR90Corvette = "2"
        case starDestroyer = "3"
        case sentinel = "5"
        case deathStar = "9"
        case yWing = "11"
        case millenniumFalcon = "10"
        case tie = "13"
        case executor = "15"
        case xWing = "12"
        case rebelTransport = "17"
    }
    
    case people(People)
    case planets(Planets)
    case starships(Starships)
    
    var url: URL {
        switch self {
        case .people(let people):
            return URL(string: "https://www.swapi.tech/api/people/\(people.rawValue)")!
        case .planets(let planets):
            return URL(string: "https://www.swapi.tech/api/planets/\(planets.rawValue)")!
        case .starships(let starships):
            return URL(string: "https://www.swapi.tech/api/starships/\(starships.rawValue)")!
        }
    }
}

enum NetworkError: Error {
    case noData
    case decodingError
}

final class NetworkManager {
    static let shared = NetworkManager()
    
    private init() {}
    
    func fetch<T: Decodable>(_ type: T.Type, from url: URL, completion: @escaping (Result<T, NetworkError>) -> Void) {
        URLSession.shared.dataTask(with: url) { data, _, error in
            guard let data else {
                completion(.failure(.noData))
                print(error?.localizedDescription ?? "No error description")
                return
            }
            
            do {
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                let model = try decoder.decode(T.self, from: data)
                DispatchQueue.main.async {
                    completion(.success(model))
                }
            } catch {
                completion(.failure(.decodingError))
            }
            
        }.resume()
    }
    
}
