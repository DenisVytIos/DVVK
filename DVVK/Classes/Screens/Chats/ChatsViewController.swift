//
//  ChatsViewController.swift
//  DVVK
//
//  Created by Denis on 6/19/19.
//  Copyright © 2019 Denis. All rights reserved.
//

import UIKit

class ChatsViewController: UIViewController {
  
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

extension ChatsViewController: UITableViewDelegate {
  func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    return 44
  }
}

extension ChatsViewController: UITableViewDataSource {
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
