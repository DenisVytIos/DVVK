//
//  Typealiases.swift
//  DVVK
//
//  Created by Denis on 5/8/19.
//  Copyright © 2019 Denis. All rights reserved.
//

import Foundation

typealias StaticCellProtocol     = NibLoadable & HeightContainable
typealias ItemClosure<T>         = ((T) -> Void)
typealias OptionalItemClosure<T> = ((T?) -> Void)
typealias VoidClosure            = (()-> Void)
typealias ResultHandler<Value>   = (Result<Value>) -> Void
