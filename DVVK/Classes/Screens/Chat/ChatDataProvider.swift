//
//  ChatDataProvider.swift
//  DVVK
//
//  Created by Denis on 6/21/19.
//  Copyright © 2019 Denis. All rights reserved.
//

import Foundation

final class ChatDataProvider {
  private var messages: [Message] = []
  
  func set(messages: [Message]) {
    self.messages = messages
  }
  
  func numberOfRows()-> Int {
    return messages.count
  }
  
  func message(by indexPath: IndexPath) -> Message {
    return messages[indexPath.row]
  }
}
