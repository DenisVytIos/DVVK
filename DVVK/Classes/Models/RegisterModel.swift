//
//  RegisterModel.swift
//  DVVK
//
//  Created by Denis on 5/20/19.
//  Copyright © 2019 Denis. All rights reserved.
//

import UIKit

class RegisterModel{
  var photo: UIImage?
  var email: String?
  var password: String?
  var sex: Sex = .male
  var birthday: Date?
  
  var isFilled: Bool {
    guard !(email ?? "").isEmpty, !(password ?? "").isEmpty, birthday != nil else {
      return false
    }
    return true
  }
}
