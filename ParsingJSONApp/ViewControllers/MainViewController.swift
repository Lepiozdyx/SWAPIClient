//
//  MainViewController.swift
//  ParsingJSONApp
//
//  Created by Alex on 05.05.2023.
//

import UIKit

enum Link {
    case people
    case planets
    case starships
    
    var url: URL {
        switch self {
        case .people:
            return URL(string: "https://www.swapi.tech/api/people/")!
        case .planets:
            return URL(string: "https://www.swapi.tech/api/planets/")!
        case .starships:
            return URL(string: "https://www.swapi.tech/api/starships/")!
        }
    }
}

final class MainViewController: UIViewController {
    
    // MARK: - IBOutlets
    @IBOutlet var activityIndicator: UIActivityIndicatorView!
    
    // MARK: - Override methods
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchInfo()
    }

    // MARK: - Private methods
    private func fetchInfo() {
        
        URLSession.shared.dataTask(with: Link.starships.url) { [weak self] data, _, error in
            guard let data else {
                print(error?.localizedDescription ?? "No error description")
                return
            }
            
            DispatchQueue.main.async {
                self?.activityIndicator.stopAnimating()
            }
            
            do {
                let decoder = JSONDecoder()
                let model = try decoder.decode(Starships.self, from: data)
                
                let names = model.results.map { $0.name }

                names.forEach { name in
                    print("The names of 'Star Wars' ships: \(name)")
                }
            } catch {
                print(error.localizedDescription)
            }

        }.resume()
    }

}

