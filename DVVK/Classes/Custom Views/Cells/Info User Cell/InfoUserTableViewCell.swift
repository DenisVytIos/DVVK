//
//  InfoUserTableViewCell.swift
//  DVVK
//
//  Created by Denis on 5/7/19.
//  Copyright © 2019 Denis. All rights reserved.
//

import UIKit

class InfoUserTableViewCell: UITableViewCell, StaticCellProtocol {
    
    @IBOutlet private weak var backgroundFiedsView: UIView!
    @IBOutlet private weak var photoView: PhotoView!
  
    static var height: CGFloat {
        return 100
    }
  
  var photoViewClicked: VoidClosure?

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        Decorator.decorate(cell: self)
      photoView.clicked = photoViewClicked
       
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
extension InfoUserTableViewCell {
    fileprivate class Decorator {
        static func decorate (cell: InfoUserTableViewCell){
            cell.selectionStyle = .none
            cell.backgroundColor = #colorLiteral(red: 0.9450980392, green: 0.9450980392, blue: 0.9450980392, alpha: 1)
            cell.backgroundFiedsView.layer.borderColor = #colorLiteral(red: 0.7450980392, green: 0.7450980392, blue: 0.7450980392, alpha: 1)
            cell.backgroundFiedsView.layer.borderWidth = 0.5
        }
    }
}
