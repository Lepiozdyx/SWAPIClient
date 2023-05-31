//
//  extension + UIViewController.swift
//  ParsingJSONApp
//
//  Created by Alex on 30.05.2023.
//

import UIKit

extension UIViewController {
    func presentAlertError(with error: NetworkError) {
        DispatchQueue.main.async {
            let alert = UIAlertController(
                title: "Error",
                message: error.localizedDescription,
                preferredStyle: .alert
            )
            alert.addAction(UIAlertAction(title: "OK", style: .default))
            self.present(alert, animated: true)
        }
    }
}
