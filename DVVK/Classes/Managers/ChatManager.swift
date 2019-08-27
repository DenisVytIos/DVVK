//
//  ChatManager.swift
//  DVVK
//
//  Created by Denis on 6/19/19.
//  Copyright © 2019 Denis. All rights reserved.
//

import Foundation

final class ChatManager: FirebaseManager {
  static let shared = ChatManager()
  
  func send(message: Message, on chat: Chat) {
    
    guard let dict = message.dictionary else {
      return
    }
    
    guard let chatId = chat.id else {
      return
    }
  
    chatsRef.child(chatId).child("messages").child(message.id).setValue(dict)
  }
  
  func startChatIfNeeded(chat: Chat, callback: @escaping VoidClosure) {
    checkIsChatExist(chat: chat) { (result) in
      if !result {
        self.startChat(chat: chat, callback: callback)
      }
    }
  }
  
  func checkIsChatExist(chat: Chat, callback: @escaping ItemClosure<Bool>) {
    guard  let chatId = chat.id else {
      return
    }
    
    chatsRef.child(chatId).observeSingleEvent(of: .value) { (snapshot) in
      callback(snapshot.exists())
    }
  }
  
  func startChat(chat: Chat, callback: @escaping VoidClosure) {
    guard let chatId = chat.id else {
      return
    }
    
    guard let chatDict = chat.dictionary else {
      return
    }
    
    chatsRef.child(chatId).setValue(chatDict) { (error, ref) in
      callback()
    }
  }
  
  func loadingChats(callback: @escaping ItemClosure<[Chat]>) {
    chatsRef.observe(.value) { (snapshot) in
      if let dict = snapshot.value as?  [String: Any] {
        let chats = dict.map({ (element) -> Chat? in
          let chatId = element.key
          
          if let chatDict = element.value as? [String: Any], let usersDict = chatDict["users"] as? [[String: Any]] {
            let users = usersDict.map { try? DVUser.init(from: $0) }.compactMap { $0 }
            return Chat.init(id: chatId, users: users)
          }
          return nil
        }).compactMap { $0 }
        callback(chats)
      }
    }
    
  }
  
  func loadingMessages(chat: Chat, callback: @escaping ItemClosure<[Message]>) {
    // Chats -> id Chats -> messages
    guard let chatId = chat.id else {
      return
    }
    let messagesRef = chatsRef.child(chatId).child("messages")
    messagesRef.observe(.value) { (snapshot) in
      if let dict = snapshot.value as? [String: [String: Any]] {
        let messages = dict.map{ try?  Message.init(from: $0.value) }.compactMap { $0 }.sorted { $0.time ?? 0 < $1.time ?? 0 }
        callback(messages)
      }
    }
  }
}
