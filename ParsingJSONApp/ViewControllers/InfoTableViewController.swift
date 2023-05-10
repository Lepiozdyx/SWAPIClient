//
//  InfoTableViewController.swift
//  ParsingJSONApp
//
//  Created by Alex on 10.05.2023.
//

import UIKit

final class InfoTableViewController: UITableViewController {
    
    // MARK: - Private properties
    private let networkManager = NetworkManager.shared
    private var results: [Essence] = []

    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        results.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "infoCell", for: indexPath)
        var content = cell.defaultContentConfiguration()
        let result = results[indexPath.row]
        
        content.text = result.name
        content.textProperties.color = UIColor.systemYellow
        content.textProperties.font = UIFont.systemFont(ofSize: 22)
        cell.backgroundColor = UIColor.black
        cell.contentConfiguration = content
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }

}

// MARK: - Networking
extension InfoTableViewController {
    func fetchData(from url: URL) {
        networkManager.fetch(About.self, from: url) { [weak self] result in
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
