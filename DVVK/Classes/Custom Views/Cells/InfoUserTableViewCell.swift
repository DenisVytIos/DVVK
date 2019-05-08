//
//  InfoUserTableViewCell.swift
//  DVVK
//
//  Created by Denis on 5/7/19.
//  Copyright © 2019 Denis. All rights reserved.
//

import UIKit

class InfoUserTableViewCell: UITableViewCell, StaticCellProtocol {
    
    static var height: CGFloat {
        return 100
    }
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
