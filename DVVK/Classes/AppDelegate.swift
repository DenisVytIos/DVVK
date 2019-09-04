//
//  AppDelegate.swift
//  DVVK
//
//  Created by Denis on 5/3/19.
//  Copyright © 2019 Denis. All rights reserved.
//

import UIKit
import Firebase

@UIApplicationMain

class AppDelegate: UIResponder, UIApplicationDelegate {
  
  var window: UIWindow?
  
  
  func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
    Router.shared.root(&window)
    FirebaseApp.configure()
    
    AuthManager.shared.sighInIfNeeded { _ in
      UserManager.shared.fetchCurrentUser()
    }
    
//    AuthManager.shared.sighInIfNeeded()
    /////////////////////////////////////////
//        AuthManager.shared.sighInIfNeeded { _ in
//          UserManager.shared.fetchCurrentUser {
//            UserManager.shared.loadingUsers { users in
//              let chat = Chat (id: "NEWCHAT", users: [users.first!, UserManager.shared.currentUser!])
//              ChatManager.shared.startChat(chat: chat, callback: {
//
//              })
//            }
//          }
//    }
    //////////////////////////////
//        let chat = Chat(id: "45656677")
//        ChatManager.shared.loadingMessages(chat: chat) { (messages) in
//          print(messages)
//        }
    
    //////////////////////////////////
//        let message = Message()
//        message.senderId = "123"
//        message.text = "text"
//        message.time = Date().timeIntervalSince1970
//    let chat = Chat(id: "45656677")
//
//   
//        ChatManager.shared.send(message: message, on: chat)

//  SecureStorageManager.shared.eraseUserDataIfNeeded()
    return true
  }
  private func configureExternalFrameworks() {
    FirebaseApp.configure()
  }
  
  
  
}

