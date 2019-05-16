//
//  TextTableViewCell.swift
//  DVVK
//
//  Created by Denis on 5/16/19.
//  Copyright © 2019 Denis. All rights reserved.
//

import UIKit

class TextTableViewCell: UITableViewCell, NibLoadable {
  
  @IBOutlet private weak var label: UILabel!
  override func awakeFromNib() {
    super.awakeFromNib()
    
    selectionStyle = .none
  }
  
  func set(text: String?) {
    label.text = text
  }
  
}
