//
//  MainViewController.swift
//  ParsingJSONApp
//
//  Created by Alex on 05.05.2023.
//

import UIKit

private class MainViewController: UIViewController {
    
    // MARK: - IBOutlets
    @IBOutlet var activityIndicator: UIActivityIndicatorView!
    
    // MARK: - Override methods
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchInfo()
    }

    // MARK: - Private methods
    private func fetchInfo() {
        guard let url = URL(string: "https://www.swapi.tech/api/people") else { return }
        
        URLSession.shared.dataTask(with: url) { [weak self] data, _, error in
            guard let data else {
                print(error?.localizedDescription ?? "No error description")
                return
            }
            
            do {
                let decoder = JSONDecoder()
                let model = try decoder.decode(Characters.self, from: data)
                
                let names = model.results.map { $0.name }

                names.forEach { name in
                    print("The names of Star Wars heroes: \(name)")
                }
            } catch {
                print(error.localizedDescription)
            }
            
            DispatchQueue.main.async {
                self?.activityIndicator.stopAnimating()
            }
            
        }.resume()
    }

}

