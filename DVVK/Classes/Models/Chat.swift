//
//  Chat.swift
//  DVVK
//
//  Created by Denis on 6/20/19.
//  Copyright © 2019 Denis. All rights reserved.
//

import Foundation

class Chat: Codable {
  var id: String?
  var messages: [Message] = []
  var users: [DVUser] = []
  
  init(id: String, users: [DVUser]) {
    self.id = id
    self.users = users
  }
//  init(id: String) {
//    self.id = id
//    
//  }
  var oponent: DVUser? {
    return users.filter { UserManager.shared.currentUser?.id != $0.id }.first
  }
}
