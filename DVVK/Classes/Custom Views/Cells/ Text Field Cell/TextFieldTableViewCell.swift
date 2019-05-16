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

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
