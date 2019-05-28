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
  
  var indexChanged: ItemClosure<Int>?
  
  override func awakeFromNib() {
    super.awakeFromNib()
    
    selectionStyle = .none
    addTargets()
  }
  func set(titles: [String])  {
    segmentControl.removeAllSegments()
    titles.enumerated().forEach { i, title in
      segmentControl.insertSegment(withTitle: title, at: i, animated: true)
    }
    segmentControl.selectedSegmentIndex = 0
  }
  private func addTargets() {
    segmentControl.addTarget(self, action: #selector(segmentedControlChangedIndex(sender:)), for: .valueChanged)
  }
  @objc private func segmentedControlChangedIndex(sender: UISegmentedControl) {
    indexChanged?(sender.selectedSegmentIndex)
  }
}
