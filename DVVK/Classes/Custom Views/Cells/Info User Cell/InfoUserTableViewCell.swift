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
  @IBOutlet private weak var topTextField: UITextField!
  @IBOutlet private weak var bottomTextField: UITextField!
  
  static var height: CGFloat {
    return 100
  }
  
  var photoViewClicked: VoidClosure?{
    didSet{
      photoView.clicked = photoViewClicked
    }
  }
  
  var topTextChanged: ItemClosure<String>?
  var bottomTextChanged: ItemClosure<String>?
  
  override func awakeFromNib() {
    super.awakeFromNib()
    // Initialization code
    Decorator.decorate(cell: self)
    addTargets()
    
    
  }
  private func addTargets() {
    topTextField.addTarget(self, action: #selector(topTextFieldChanged(sender:)), for:.editingChanged)
    bottomTextField.addTarget(self, action: #selector(bottomTextFieldChanged(sender:)), for:.editingChanged)
  }
  
  @objc private func topTextFieldChanged(sender: UITextField) {
    topTextChanged?(sender.text ?? "")
  }
  @objc private func bottomTextFieldChanged(sender: UITextField) {
    bottomTextChanged?(sender.text ?? "")
  }
  func set(image: UIImage?) {
    photoView.set(image: image)
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
