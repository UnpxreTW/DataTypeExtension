//
//  UInt32.swift
//  DataTypeExtension
//
//  Created by Unpxre on 2019/11/15.
//  Copyright © 2019 Unpxre. All rights reserved.
//
import Foundation

extension UInt32 {

    public func toInt() -> Int { Int(CFSwapInt32BigToHost(self)) }
}
