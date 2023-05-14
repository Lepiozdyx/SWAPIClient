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
    private var nextPageURL: URL?

    // MARK: - UITableViewDataSource
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        results.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "infoCell", for: indexPath)
        var content = cell.defaultContentConfiguration()
        let result = results[indexPath.row]
        
        content.text = result.name
        content.textProperties.color = UIColor.systemYellow
        content.textProperties.font = UIFont(name: "Avenir-Heavy", size: 22)!
        cell.backgroundColor = UIColor.black
        cell.contentConfiguration = content
        
        return cell
    }
    
    // MARK: - UITableViewDelegate
    override func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if indexPath.row == results.count - 5, let nextPageURL = nextPageURL {
            self.nextPageURL = nil
            fetchData(from: nextPageURL)
        }
    }
    
    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let indexPath = tableView.indexPathForSelectedRow else { return }
        let essence = results[indexPath.row]
        guard let detailVC = segue.destination as? DetailViewController else { return }
        detailVC.selectedEssenceURL = URL(string: essence.url)
    }

}

// MARK: - Networking
extension InfoTableViewController {
    func fetchData(from url: URL) {
        networkManager.fetch(from: url) { [weak self] result in
            switch result {
            case .success(let about):
                self?.results.append(contentsOf: about.results)
                if let next = about.next {
                    self?.nextPageURL = URL(string: next)
                }
                self?.tableView.reloadData()
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
}
