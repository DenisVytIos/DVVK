//
//  PostManager.swift
//  DVVK
//
//  Created by Denis on 6/1/19.
//  Copyright © 2019 Denis. All rights reserved.
//

import Foundation
import Firebase

final class PostManager: FirebaseManager {
  enum Result {
    case success([Post])
    case error(String)
    
  }
  private override init() {}
  
  static let shared = PostManager()
  
  func createPost(from user: User, with text: String, completion: @escaping ItemClosure<FirebaseResult>){
    let postID = UUID().uuidString
    let post = Post(text: text)
    
    guard let dictionary = post.dictionary else {
      completion(.error("Post model not dictionary"))
      return
    }
    usersRef.child(user.uid).child(Keys.posts.rawValue).child(postID).setValue(dictionary) { (error, reference) in
      if let error = error?.localizedDescription{
        completion(.error(error))
        return
      }
      
      completion(.success)
    }
  }
  
  func loadingAllPosts(completion: @escaping ItemClosure<Result>) {
    usersRef.observe(.value) { (snapshot) in
      var result:[Post] = []
      guard let value = snapshot.value as? [String: [AnyHashable: Any]] else {
        completion(.error("Posts not exists"))
        return
      }
      let allKeys = value.keys
      allKeys.forEach({ (key) in
        
        if let element = value[key], let postsDictionaryArray = (element[Keys.posts.rawValue] as? [String: [AnyHashable: Any]]) {
          let posts = postsDictionaryArray.compactMap { try? Post.init(from: $0.value)}
          result.append(contentsOf: posts)
        }
      })
  
      completion(.success(result))
    }
  }
}
  extension PostManager {
    fileprivate enum Keys: String {
      case posts
    }
    
  }

