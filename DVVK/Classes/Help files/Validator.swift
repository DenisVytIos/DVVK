//
//  Validator.swift
//  DVVK
//
//  Created by Denis on 5/27/19.
//  Copyright © 2019 Denis. All rights reserved.
//

import Foundation

enum Validators {
  static func isSimpleEmail(_ email: String) -> Bool {
    let emailRegEx = "^.+@.+\\..{2,}$"
    return check(text: email, regEx: emailRegEx)
  }
  private static func check(text: String, regEx: String) -> Bool {
    let predicate = NSPredicate (format: "SELF MATCHES %@", regEx)
    return predicate.evaluate(with: text)
  }
}
