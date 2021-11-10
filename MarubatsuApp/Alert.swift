//
//  Alert.swift
//  MarubatsuApp
//
//  Created by Yasuo Niihori on 2021/11/09.
//

import UIKit

class Alert: UIAlertController {
    func showAlert(title: String, message: String, viewController: UIViewController) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .default)
        alert.addAction(action)
        viewController.present(alert, animated: true)
    }
}


