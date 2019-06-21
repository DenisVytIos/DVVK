//
//  Message.swift
//  DVVK
//
//  Created by Denis on 6/19/19.
//  Copyright © 2019 Denis. All rights reserved.
//

import Foundation

final class Message: Codable {
  var id: String
  var senderId: String? // id of sender user
  var text: String?
  var time: TimeInterval?
  
  init() {
    id = UUID().uuidString
  }
  convenience init(text: String){
    self.init()
    self.senderId = UserManager.shared.currentUser?.id
    self.text = text
    self.time = Date().timeIntervalSince1970
  }
  
  func getText() -> String {
    return text ?? ""
  }
}
