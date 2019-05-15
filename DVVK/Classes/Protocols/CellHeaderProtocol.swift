//
//  CellHeaderProtocol.swift
//  DVVK
//
//  Created by Denis on 5/15/19.
//  Copyright © 2019 Denis. All rights reserved.
//

import Foundation

protocol CellHeaderProtocol {
    associatedtype CellType
    
    var cellModels: [CellType] { get }
}
