//
//  Double.swift
//  DataTypeExtension
//
//  Created by Unpxre on 2019/10/17.
//  Copyright © 2019 Ultracker. All rights reserved.
//

extension Double {

    public init?<Source>(_ value: Source?) where Source: BinaryFloatingPoint {
        guard let value = value else { return nil }
        self.init(value)
    }

    /// 從 Double 轉換為 8 位元組陣列。
    /// - Note:
    /// - Returns: 轉換結果。
    public func to8ByteArray() -> [Byte] {
        var number = self
        return withUnsafePointer(to: &number) {
            $0.withMemoryRebound(to: Byte.self, capacity: 8) {
                Array(UnsafeBufferPointer(start: $0, count: 8))
            }
        }
    }
}
