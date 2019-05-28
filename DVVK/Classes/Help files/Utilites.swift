//
//  Utilites.swift
//  DVVK
//
//  Created by Denis on 5/24/19.
//  Copyright © 2019 Denis. All rights reserved.
//

import Foundation

func ID() -> String {
  let str = " abc35df5ghj345klpzxcv3245bnmqwe67rtyuio1234567890"
  let arr = Array(str)
  func random() -> String {
    return String(describing: arr[Int.random(in: arr.indices)])
  }
  var result = ""
  let countOfCharacters = 24
  for _ in 0..<countOfCharacters {
    result += random()
  }
  return result
}
