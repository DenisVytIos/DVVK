//
//  TextFieldTableViewCell.swift
//  DVVK
//
//  Created by Denis on 5/16/19.
//  Copyright © 2019 Denis. All rights reserved.
//

import UIKit

class TextFieldTableViewCell: UITableViewCell, NibLoadable {
  
  @IBOutlet weak var  textField: UITextField!
  
  var textChanged: ItemClosure<String>?

    override func awakeFromNib() {
        super.awakeFromNib()
      addTargets()
    }

  private func addTargets () {
    textField.addTarget(self, action: #selector(textFieldChanged(sender:)), for: .editingChanged)
  }
  @objc private func textFieldChanged(sender: UITextField){
    textChanged?(sender.text ?? "")
  }
}
