//
//  HeaderTitleView.swift
//  DVVK
//
//  Created by Denis on 5/15/19.
//  Copyright © 2019 Denis. All rights reserved.
//

import UIKit

class HeaderTitleView: UIView, NibLoadable {
    
    @IBOutlet private weak var label: UILabel!
    func set(title: String) {
        label.text = title
    }
}
