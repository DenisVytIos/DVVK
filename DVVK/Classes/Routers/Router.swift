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
    
    func root(_ window: inout UIWindow?) {
        let frame = UIScreen.main.bounds
        window = UIWindow(frame: frame)
        window?.makeKeyAndVisible()
      
      let vc = SecureStorageManager.shared.isLoggedIn() ? CreatePostViewController() : ViewController()
        
        window?.rootViewController = UINavigationController(rootViewController: vc)
    }
  
  var startControllerAfterAuth: UIViewController {
    
    let createPostVC = CreatePostViewController()
    let createPostNC = UINavigationController(rootViewController: createPostVC)
    let createPostTabBarItem = UITabBarItem(tabBarSystemItem: .more, tag: 0)
    createPostNC.tabBarItem = createPostTabBarItem
    
    let chatsVC = ChatsViewController()
    let chatsNC = UINavigationController.init(rootViewController: chatsVC)
    let chatsTabbarItem = UITabBarItem(tabBarSystemItem: .contacts, tag: 2)
    chatsNC.tabBarItem = chatsTabbarItem
    
    let feedVC = FeedViewController()
    let feedNC = UINavigationController(rootViewController: feedVC)
    let
    feedTabBarItem = UITabBarItem(tabBarSystemItem: .favorites, tag: 1)
    feedNC.tabBarItem = feedTabBarItem
    
    let tabBarVC = UITabBarController()
    tabBarVC.setViewControllers([feedNC, chatsNC, createPostNC], animated: true)
    return tabBarVC
  }
}
