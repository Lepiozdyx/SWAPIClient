//
//  NetworkManager.swift
//  ParsingJSONApp
//
//  Created by Alex on 09.05.2023.
//

import Foundation

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
