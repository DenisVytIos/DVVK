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

class AuthManager: FirebaseManager {
  var currentUser: User?
  static let shared = AuthManager()
  //  private init() {}
  private let auth = Auth.auth()
  //  FirebaseResult
  
  func sighInIfNeeded(completion:  ItemClosure<FirebaseResult>? = nil) {
    let credentials = SecureStorageManager.shared.loadEmailAndPassword()
    
    guard let email = credentials.email, let password = credentials.password else {
      return
    }
    singIn(with: email, and: password, completion: completion ?? {_ in})
  }
  
  func singIn(with email: String?, and password: String?, completion: @escaping ItemClosure<FirebaseResult>) {
    guard let email = email, let password = password else {
      completion(FirebaseResult.error("Something wrong with email or password.Please try again"))
      return
    }
    
    auth.signIn(withEmail: email, password: password)  { (result, error) in
      
      if let error = error {
        completion(FirebaseResult.error(error.localizedDescription))
        return
      }
      guard let user = result?.user else {
        completion(FirebaseResult.error("user not exist"))
        return
      }
      self.currentUser = user
      completion(FirebaseResult.success)
    }
  }
  
  func register(with model: RegisterModel, completion: @escaping ResultHandler<Void>) {
    guard model.isFilled else {
      completion(.failure(CustomErrors.unknownError))
      return
    }
    guard let email = model.email, let password = model.password else {
      completion(.failure(CustomErrors.unknownError))
      return
    }
    
    guard Validators.isSimpleEmail(email) else {
      completion(.failure(CustomErrors.invalidEmail))
      return
    }
    //   let userRef = sourseRef.child("users")
    let id = model.userId
    auth.createUser(withEmail: email, password: password) { (result, error) in
      if let error = error {
        completion(.failure(error))
        return
      }
      
      guard let res = result else {
        completion(.failure(CustomErrors.unknownError))
        return
      }
      self.currentUser = res.user
      
      var dict = model.dict
      dict["id"] = id
      self.usersRef.child(res.user.uid).setValue(dict, withCompletionBlock: { (error, reference) in
        self.addAvatarUrlIfNeeded(for: model, user: res.user)
        completion(.success(()))
      })
    }
  }
  
  func addAvatarUrlIfNeeded(for model: RegisterModel, user: User) {
    StorageManager.shared.loadAvatarUrl(for: model) { (url) in
      guard let url = url else {
        return
      }
      self.usersRef.child(user.uid).child("avatarUrl").setValue(url.absoluteString)
    }
  }
}
