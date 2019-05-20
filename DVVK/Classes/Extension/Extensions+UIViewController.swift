//
//  Extensions+UIViewController.swift
//  DVVK
//
//  Created by Denis on 5/20/19.
//  Copyright © 2019 Denis. All rights reserved.
//

import UIKit

extension UIViewController {
  func showAlert(with title: String, and message: String) {
    let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
    let okAction = UIAlertAction(title: "Ok", style: .default, handler: nil)
    alertController.addAction(okAction)
    present(alertController, animated: true, completion: nil)
  }
}

