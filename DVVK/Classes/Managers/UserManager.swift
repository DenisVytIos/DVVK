//
//  UserManager.swift
//  DVVK
//
//  Created by Denis on 6/19/19.
//  Copyright © 2019 Denis. All rights reserved.
//

import Firebase

final class UserManager: FirebaseManager {
  static let shared = UserManager()
  
  var currentUser: DVUser?
  
  func fetchCurrentUser(callback: VoidClosure? = nil) {
    
    guard let currentUserId = AuthManager.shared.currentUser?.uid else {
      return
    }
    
    usersRef.child(currentUserId).observeSingleEvent(of: .value) { (snapshot) in
      if let dict = snapshot.value as? [String: Any] {
        self.currentUser = try? DVUser.init(from: dict)
        callback?()
      }
    }
  }
  
  func loadingUsers(completion: @escaping ItemClosure<[DVUser]>) {
    usersRef.observe(.value) { (snapshot) in
      if let dict = (snapshot.value as? [String: [String: Any]]) {
        completion(dict.map({ (userDict) -> DVUser in
          return try! DVUser(from: userDict.value)
        }).filter { $0.id !=  self.currentUser?.id })
      }
    }
  }
}
