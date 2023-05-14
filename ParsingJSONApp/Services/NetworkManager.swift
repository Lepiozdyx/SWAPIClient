//
//  NetworkManager.swift
//  ParsingJSONApp
//
//  Created by Alex on 09.05.2023.
//

import Foundation
import Alamofire

final class NetworkManager {
    static let shared = NetworkManager()
    
    private init() {}
    
//    func fetch<T: Decodable>(_ type: T.Type, from url: URL, completion: @escaping (Result<T, NetworkError>) -> Void) {
//        URLSession.shared.dataTask(with: url) { data, _, error in
//            guard let data else {
//                completion(.failure(.noData))
//                print(error?.localizedDescription ?? "No error description")
//                return
//            }
//
//            do {
//                let decoder = JSONDecoder()
//                decoder.keyDecodingStrategy = .convertFromSnakeCase
//                let model = try decoder.decode(T.self, from: data)
//                DispatchQueue.main.async {
//                    completion(.success(model))
//                }
//            } catch {
//                completion(.failure(.decodingError))
//            }
//
//        }.resume()
//    }
    
    func fetch(from url: URL, completion: @escaping (Result<About, AFError>) -> Void) {
        AF.request(url)
            .validate()
            .responseJSON { dataResponse in
                switch dataResponse.result {
                case .success(let value):
                    guard let results = About.getAbout(from: value) else { return }
                    completion(.success(results))
                case .failure(let error):
                    completion(.failure(error))
                }
            }
    }
    
}
