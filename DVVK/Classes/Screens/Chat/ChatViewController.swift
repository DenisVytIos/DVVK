//
//  ChatViewController.swift
//  DVVK
//
//  Created by Denis on 6/19/19.
//  Copyright © 2019 Denis. All rights reserved.
//

import UIKit

class ChatViewController: UIViewController {
  
  
  @IBOutlet weak var tableView: UITableView!
  @IBOutlet weak var textField: UITextField!
  
  private var user: DVUser?
  private var chat: Chat?
  private lazy var controller = ChatController.init(viewController: self, chat: chat)
  
  convenience init(user: DVUser, chat: Chat) {
    self.init()
    self.user = user
    self.chat = chat
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    controller.viewDidLoad()
    tableView.separatorColor = .clear
  }
  
  @IBAction func sendClicked() {
    let text = textField.text
    controller.sendButtonClicked(with: text)
  }
}



