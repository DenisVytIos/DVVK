//
//  FirebaseManager.swift
//  DVVK
//
//  Created by Denis on 6/1/19.
//  Copyright © 2019 Denis. All rights reserved.
//

import Foundation
import Firebase

class FirebaseManager {
  var sourseRef: DatabaseReference {
    return Database.database().reference()
  }
  
   var usersRef: DatabaseReference {
    return sourseRef.child("users")
  }
  var chatsRef: DatabaseReference {
    return sourseRef.child("chats")
  }
}
