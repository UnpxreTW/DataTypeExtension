//
//  Float.swift
//  DataTypeExtension
//
//  Created by Unpxre on 2019/10/16.
//  Copyright © 2019 Ultracker. All rights reserved.
//

extension Float {

    /// 限制數值範圍。
    public func confineRange(from low: Float, to high: Float) -> Float {
        let upper = high > low ? high : low
        let lower = high > low ? low : high
        if self > upper { return upper }
        if self < lower { return lower }
        return self
    }

    public mutating func confineRanged(from low: Self, to high: Self) {
        let upper = high > low ? high : low
        let lower = high > low ? low : high
        if self > upper { self = upper }
        if self < lower { self = lower }
    }

    public func to4ByteArray() -> [Byte] {
        var number = self
        return withUnsafePointer(to: &number) {
            $0.withMemoryRebound(to: Byte.self, capacity: 8) {
                Array(UnsafeBufferPointer(start: $0, count: 8))
            }
        }
    }
}
