//
//  StartRouter.swift
//  DVVK
//
//  Created by Denis on 5/4/19.
//  Copyright © 2019 Denis. All rights reserved.
//

import UIKit

final class StartRouter {
  
  private weak var mainRouter: Router?
  
  static let shared = StartRouter()
  
  private init() {}
  
  func goToRegisterScreen(from source: UIViewController) {
    let vc = RegisterViewController()
    source.navigationController?.pushViewController(vc, animated: true)
  }
  
  func goToLoginScreen(from source: UIViewController) {
    let vc = LoginViewController()
    source.navigationController?.pushViewController(vc, animated: true)
  }
  
  func routeAfterSuccessAuth(from source: UIViewController) {
    let vc = Router.shared.startControllerAfterAuth 
    source.present(vc, animated: true, completion: nil)
  }
}
