//
//  MainViewController.swift
//  ParsingJSONApp
//
//  Created by Alex on 05.05.2023.
//

import UIKit

enum UserAction: CaseIterable {
    case people
    case planets
    case starships
    
    var title: String {
        switch self {
        case .people:
            return "People"
        case .planets:
            return "Planets"
        case .starships:
            return "Starships"
        }
    }
}

final class MainCollectionViewController: UICollectionViewController {
    
    // MARK: - Private properties
    private let userActions = UserAction.allCases
    private let networkManager = NetworkManager.shared
    
    // MARK: - UICollectionViewDataSource
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        userActions.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "userAction", for: indexPath)
        guard let cell = cell as? UserActionCell else { return UICollectionViewCell() }
        cell.userActionLabel.text = userActions[indexPath.item].title
        return cell
    }
    
    // MARK: - UICollectionViewDelegate
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let userAction = userActions[indexPath.item]
        
        switch userAction {
        case .people:
            performSegue(withIdentifier: "peopleSegue", sender: nil)
        case .planets:
            performSegue(withIdentifier: "planetsSegue", sender: nil)
        case .starships:
            performSegue(withIdentifier: "starshipsSegue", sender: nil)
        }
    }
    
    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let infoVC = segue.destination as? InfoTableViewController else { return }

        if segue.identifier == "peopleSegue" {
            infoVC.navigationItem.title = UserAction.people.title
            infoVC.fetchData(from: StarWarsAPI.peopleURL.url)
        } else if segue.identifier == "planetsSegue" {
            infoVC.navigationItem.title = UserAction.planets.title
            infoVC.fetchData(from: StarWarsAPI.planetsURL.url)
        } else if segue.identifier == "starshipsSegue" {
            infoVC.navigationItem.title = UserAction.starships.title
            infoVC.fetchData(from: StarWarsAPI.starshipsURL.url)
        }
    }

}

// MARK: - UICollectionViewDelegateFlowLayout
extension MainCollectionViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: UIScreen.main.bounds.width - 48, height: 100)
    }
}
