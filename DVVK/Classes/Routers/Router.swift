//
//  Router.swift
//  DVVK
//
//  Created by Denis on 5/4/19.
//  Copyright © 2019 Denis. All rights reserved.
//

import UIKit

final class Router{
    static let shared = Router()
    
    private init(){}
    
    private let rootViewController: UIViewController = ViewController()
    
    func root(_ window: inout UIWindow?) {
        let frame = UIScreen.main.bounds
        window = UIWindow(frame: frame)
        window?.makeKeyAndVisible()
        
        window?.rootViewController = UINavigationController(rootViewController: rootViewController)
    }
}
