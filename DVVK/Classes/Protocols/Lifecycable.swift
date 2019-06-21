//
//  Lifecycable.swift
//  DVVK
//
//  Created by Denis on 6/20/19.
//  Copyright © 2019 Denis. All rights reserved.
//

import Foundation

protocol Lifecycable {
  func viewDidAppear()
  func viewDidLoad()
  func viewWillAppear()
}
