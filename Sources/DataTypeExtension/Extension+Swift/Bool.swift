//
//  Bool.swift
//  DataTypeExtension
//
//  Created by Unpxre on 2019/11/15.
//  Copyright © 2019 Unpxre. All rights reserved.
//
import struct Foundation.Data


extension Bool {

    public init(_ data: Data, isEqual mode: Int = 1) {
        self = Int(data).toBool(mode: mode)
    }

    public init(_ data: Data, isNotEqual mode: Int) {
        self = !(Int(data).toBool(mode: mode))
    }

    public init?(_ data: Data?, isEqual mode: Int = 1) {
        guard let data = data else { return nil }
        self.init(data)
    }

    /// 從 Bool 轉換為字串
    /// - Returns: 轉換結果。
    public func toString() -> String {
        self ? "True" : "False"
    }

    /// 從 Bool 轉換為 Int(64 bit)
    /// - Note: False 為 0、True 為 1。
    /// - Returns: 轉換結果。
    public func toInt() -> Int {
        self ? 1 : 0
    }
}
