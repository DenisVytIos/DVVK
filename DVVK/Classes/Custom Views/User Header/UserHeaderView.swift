//
//  UserHeaderView.swift
//  DVVK
//
//  Created by Denis on 5/28/19.
//  Copyright © 2019 Denis. All rights reserved.
//

import UIKit

class UserHeaderView: UIView, NibLoadable {
  
  @IBOutlet private weak var avatarView: UIImageView!
  @IBOutlet private weak var userNameLabel: UILabel!
  
  override func awakeFromNib() {
    super.awakeFromNib()
  }
  override func layoutSubviews() {
    super.layoutSubviews()
    
    avatarView.round()
  }
}
