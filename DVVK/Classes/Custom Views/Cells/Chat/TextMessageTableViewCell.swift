//
//  TextMessageTableViewCell.swift
//  DVVK
//
//  Created by Denis on 6/22/19.
//  Copyright © 2019 Denis. All rights reserved.
//

import UIKit

class TextMessageTableViewCell: UITableViewCell {
  @IBOutlet weak var cloudView: UIView!
  @IBOutlet weak var messageLabel: UILabel!
  @IBOutlet weak var timeLabel: UILabel!
  
  override func awakeFromNib() {
    super.awakeFromNib()
    
    selectionStyle = .none
  }
  
  override func layoutSubviews() {
    super.layoutSubviews()
    
    cloudView.layer.cornerRadius = 10
  }
  
  func configure(by message: Message) {
    messageLabel.text = message.getText()
    timeLabel.text = message.getFormattedTime()
  }
}

extension TextMessageTableViewCell {
  static func nibName(isOponent: Bool) -> String {
    switch isOponent {
    case true: return "OponentTextMessageTableViewCell"
    case false: return "MyTextMessageTableViewCell"
    }
  }
  
  static func nib(isOponent: Bool) -> UINib {
    return UINib.init(nibName: nibName(isOponent: isOponent), bundle: Bundle.main)
  }
}
