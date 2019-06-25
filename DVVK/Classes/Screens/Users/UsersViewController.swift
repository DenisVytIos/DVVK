//
//  UsersViewController.swift
//  DVVK
//
//  Created by Denis on 6/25/19.
//  Copyright © 2019 Denis. All rights reserved.
//

import UIKit

class UsersViewController: UIViewController {
  
  @IBOutlet weak var tableView: UITableView!
  private var users: [DVUser] = [] {
    didSet{
      tableView.reloadData()
    }
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    delegating()
    UserManager.shared.loadingUsers { user in
      self.users = user
    }
  }
  
  private func delegating() {
    tableView.delegate = self
    tableView.dataSource = self
  }
}

extension  UsersViewController: UITableViewDelegate {
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    guard let currentUser = UserManager.shared.currentUser else {
      return
    }
    let user = users[indexPath.row]
    let chat = Chat.init(id: UUID().uuidString, users: [currentUser, user])
    ChatManager.shared.startChatIfNeeded(chat: chat) {
      self.showAlert(with: " Готово", and: "Чат создан")
    }
  }
  
  func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    return 44
  }
}

extension  UsersViewController: UITableViewDataSource {
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = UITableViewCell()
    let user = users[indexPath.row]
    cell.textLabel?.text = user.email ?? user.id
    return cell
  }
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return users.count
  }
}
