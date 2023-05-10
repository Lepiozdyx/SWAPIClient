//
//  InfoTableViewController.swift
//  ParsingJSONApp
//
//  Created by Alex on 10.05.2023.
//

import UIKit

final class InfoTableViewController: UITableViewController {
    
    private let networkManager = NetworkManager.shared
    private var results: [Essence] = []

//    override func viewDidLoad() {
//        super.viewDidLoad()
//
//    }

    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        results.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "infoCell", for: indexPath)
        var content = cell.defaultContentConfiguration()
        let result = results[indexPath.row].name
        content.text = result
        cell.contentConfiguration = content
        return cell
    }

}

// MARK: - Networking
extension InfoTableViewController {
    func fetchPeople() {
        networkManager.fetch(Info.self, from: StarWars.people(.main).url) { [weak self] result in
            switch result {
            case .success(let model):
                self?.results = model.results
                DispatchQueue.main.async {
                    self?.tableView.reloadData()
                }
            case .failure(let error):
                print(error)
            }
        }
    }
    
    func fetchPlanets() {
        networkManager.fetch(Info.self, from: StarWars.planets(.main).url) { [weak self] result in
            switch result {
            case .success(let model):
                self?.results = model.results
                DispatchQueue.main.async {
                    self?.tableView.reloadData()
                }
            case .failure(let error):
                print(error)
            }
        }
    }
    
    func fetchStarships() {
        networkManager.fetch(Info.self, from: StarWars.starships(.main).url) { [weak self] result in
            switch result {
            case .success(let model):
                self?.results = model.results
                DispatchQueue.main.async {
                    self?.tableView.reloadData()
                }
            case .failure(let error):
                print(error)
            }
        }
    }
}
