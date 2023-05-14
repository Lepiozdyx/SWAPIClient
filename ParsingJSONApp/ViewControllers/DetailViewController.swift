//
//  DetailViewController.swift
//  ParsingJSONApp
//
//  Created by Alex on 13.05.2023.
//

import UIKit

final class DetailViewController: UIViewController {
    
    // MARK: - IBOutlets
    @IBOutlet var activityIndicator: UIActivityIndicatorView!
    @IBOutlet var descriptionLabel: UILabel!
    
    // MARK: - Properties
    var selectedEssenceURL: URL?
    private let networkManager = NetworkManager.shared
    
    // MARK: - View life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        guard let url = selectedEssenceURL else { return }
//
//        if url.absoluteString.contains("/people/") {
//            fetchData(of: People.self, from: url)
//        } else if url.absoluteString.contains("/planets/") {
//            fetchData(of: Planets.self, from: url)
//        } else if url.absoluteString.contains("/starships/") {
//            fetchData(of: Starships.self, from: url)
//        }
        
    }
    
   // MARK: - Private methods
//    private func fetchData<T: Decodable>(of type: T.Type, from url: URL) {
//        networkManager.fetch(type, from: url) { [weak self] result in
//            switch result {
//            case .success(let detail):
//                var description = ""
//
//                if let peopleDetail = detail as? People {
//                    description = peopleDetail.result.properties.description
//                } else if let planetDetail = detail as? Planets {
//                    description = planetDetail.result.properties.description
//                } else if let starshipDetail = detail as? Starships {
//                    description = starshipDetail.result.properties.description
//                }
//
//                DispatchQueue.main.async {
//                    self?.descriptionLabel.text = description
//                    self?.activityIndicator.stopAnimating()
//                }
//
//            case .failure(let error):
//                print(error)
//            }
//        }
//    }

}
