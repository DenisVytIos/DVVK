//
//  AuthManager.swift
//  DVVK
//
//  Created by Denis on 5/24/19.
//  Copyright © 2019 Denis. All rights reserved.
//

import Foundation
import FirebaseDatabase
import FirebaseStorage
import FirebaseAuth

class AuthManager {
  static let shared = AuthManager()
  private init() {}
  
  private var sourseRef: DatabaseReference {
    return Database.database().reference()
  }
  
  private var usersRef: DatabaseReference {
    return sourseRef.child("users")
  }
  
  private let auth = Auth.auth()
  
  func register(with model: RegisterModel, completion: @escaping ResultHandler<Void>) {
    guard model.isFilled else {
      completion(.failure(CustomErrors.unknownError))
      return
    }
    guard let email = model.email, let password = model.password else {
      completion(.failure(CustomErrors.unknownError))
      return
    }
    
    guard Validatirs.isSimpleEmail(email) else {
      completion(.failure(CustomErrors.invalidEmail))
      return
    }
    
    //   let userRef = sourseRef.child("users")
    let id = model.userId
    auth.createUser(withEmail: email, password: password) { (result, error) in
      
      
      if let error = error {
        completion(.failure(error))
      }else if let _ = result {
        //        TODO: use result if need
        var dict = model.dict
        dict["id"] = id
        self.usersRef.child(id).setValue(dict, withCompletionBlock: { (error, reference) in
          self.addAvatarUrlIfNeeded(for: model)
          completion(.success(()))
        })
      }else {
        completion(.failure(CustomErrors.unknownError))
      }
      
    }
  }
  func addAvatarUrlIfNeeded(for model: RegisterModel) {
    StorageManager.shared.loadAvatarUrl(for: model) { (url) in
      guard let url = url else {
        return
      }
      self.usersRef.child(model.userId).child("avatarUrl").setValue(url.absoluteString)
    }
  }
}
