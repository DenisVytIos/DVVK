//
//  PostTableViewCell.swift
//  DVVK
//
//  Created by Denis on 6/9/19.
//  Copyright © 2019 Denis. All rights reserved.
//

import UIKit

class PostTableViewCell: UITableViewCell, NibLoadable {
  
  @IBOutlet private weak var textView: UITextView!
  @IBOutlet private weak var postImageView: UIImageView!
  @IBOutlet private weak var imageViewHeigtConstraint: NSLayoutConstraint!

    override func awakeFromNib() {
        super.awakeFromNib()   
  }
}

extension PostTableViewCell {
  
  func setup(with post: Post) {
    textView.text = post.text ?? ""
    if let imageData = post.imageData {
      postImageView.image = UIImage(data: imageData)
      imageViewHeigtConstraint.constant = Sizes.postImageHeight
    } else {
      imageViewHeigtConstraint.constant = Sizes.zero
    }
  }
}

private extension PostTableViewCell {
  enum Sizes {
    static let zero: CGFloat = 0
    static let postImageHeight: CGFloat = 300
  }
}
