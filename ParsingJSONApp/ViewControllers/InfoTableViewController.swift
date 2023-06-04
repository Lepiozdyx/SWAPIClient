//
//  InfoTableViewController.swift
//  ParsingJSONApp
//
//  Created by Alex on 10.05.2023.
//

import UIKit

final class InfoTableViewController: UITableViewController {
    
    @IBOutlet var activityIndicator: UIActivityIndicatorView!
    
    // MARK: - Private properties
    private let searchController = UISearchController(searchResultsController: nil)
    private let networkManager = NetworkManager.shared
    private var starWars: StarWars?
    private var results: [Essence] = []
    private var filteredResults: [Essence] = []
    private var nextPageURL: URL?
    
    private var searchBarIsEmpty: Bool {
        guard let text = searchController.searchBar.text else { return false }
        return text.isEmpty
    }
    
    private var isFiltering: Bool {
        searchController.isActive && !searchBarIsEmpty
    }
    
    
    // MARK: - View life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.rowHeight = 60
        setupSearchController()
    }

    // MARK: - UITableViewDataSource
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        isFiltering ? filteredResults.count : results.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "infoCell", for: indexPath)
        var content = cell.defaultContentConfiguration()
        
        let result = isFiltering ? filteredResults[indexPath.row] : results[indexPath.row]
        
        content.text = result.name
        content.textProperties.color = UIColor.systemYellow
        content.textProperties.font = UIFont(name: "Avenir-Heavy", size: 22)!
        cell.backgroundColor = UIColor.black
        cell.contentConfiguration = content
        
        return cell
    }
    
    // MARK: - UITableViewDelegate
    override func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if indexPath.row == results.count - 10, let nextPageURL = nextPageURL {
            self.nextPageURL = nil
            fetchData(from: nextPageURL)
        }
    }
    
    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let indexPath = tableView.indexPathForSelectedRow else { return }
        let essence = isFiltering ? filteredResults[indexPath.row] : results[indexPath.row]
        guard let detailVC = segue.destination as? DetailViewController else { return }
        detailVC.selectedEssenceURL = URL(string: essence.url)
    }
    
    // MARK: - Private Methods
    private func setupSearchController() {
        searchController.searchResultsUpdater = self
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.placeholder = "Search"
        navigationItem.searchController = searchController
        definesPresentationContext = true
        
        if let textField = searchController.searchBar.value(forKey: "searchField") as? UITextField {
            textField.textColor = .systemYellow
        }
    }

}

// MARK: - Networking
extension InfoTableViewController {
    func fetchData(from url: URL) {
        networkManager.fetch(StarWars.self, from: url) { [weak self] result in
            switch result {
            case .success(let data):
                self?.starWars = data
                self?.results.append(contentsOf: data.results)
                if let next = data.next {
                    self?.nextPageURL = URL(string: next)
                }
                DispatchQueue.main.async {
                    self?.tableView.reloadData()
                    self?.activityIndicator.stopAnimating()
                }
            case .failure(let error):
                self?.presentAlertError(with: error)
            }
        }
    }
    
}

// MARK: - UISearchResultsUpdating
extension InfoTableViewController: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        filterContentForSearchText(searchController.searchBar.text ?? "")
    }
    
    private func filterContentForSearchText(_ searchText: String) {
        filteredResults = results.filter { essence in
            essence.name.lowercased().contains(searchText.lowercased())
        }
        
        tableView.reloadData()
    }
}
