//
//  SegmenterTableViewCell.swift
//  DVVK
//
//  Created by Denis on 5/15/19.
//  Copyright © 2019 Denis. All rights reserved.
//

import UIKit

class SegmenterTableViewCell: UITableViewCell, NibLoadable {
  
  @IBOutlet private weak var segmentControl: UISegmentedControl!
  
  var indexChanged: itemClosure<Int>?
  
  override func awakeFromNib() {
    super.awakeFromNib()
    
    selectionStyle = .none
    addTargets()
  }
  private func addTargets() {
    segmentControl.addTarget(self, action: #selector(segmentedControlChangedIndex(sender:)), for: .valueChanged)
  }
  @objc private func segmentedControlChangedIndex(sender: UISegmentedControl) {
    indexChanged?(sender.selectedSegmentIndex)
  }
}
