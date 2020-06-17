//
//  Int.swift
//  DataTypeExtension
//
//  Created by Unpxre on 2019/11/15.
//  Copyright © 2019 Unpxre. All rights reserved.
//
import Foundation

extension Int {

    /// 從 Data 擷取適當長度轉換為 Int
    /// - note: 長度超過 Int 限制大小時會擷取最後適當長度（最後 8 Bytes）進行轉換。
    public init(_ data: Data, isBigEndian: Bool = true) {
        var tempOutput: Data = .init()
        let finalSize: Int = MemoryLayout<Int>.size
        if data.count > finalSize {
            tempOutput = data.subdata(in: data.endIndex - finalSize ..< data.endIndex)
        } else {
            var placeholder: Byte = 0
            if let firstByte = data.first, firstByte >> 7 == 1 {
                placeholder = 0xFF
            }
            let zeroArray: [Byte] = Array(repeating: placeholder, count: finalSize - data.count)
            tempOutput = Data(zeroArray) + data
        }
        if isBigEndian { tempOutput.reverse() }
        self.init(data: tempOutput)
    }

    public init?(_ data: Data?, isBigEndian: Bool = true) {
        guard let data = data else { return nil }
        self.init(data, isBigEndian: isBigEndian)
    }

    /// 限制數值範圍
    /// - note: high 必須大於 low，否則回傳 nil。
    public func confineRange(from low: Int, to high: Int) -> Int {
        let upper = high > low ? high : low
        let lower = high > low ? low : high
        if self > upper { return upper }
        if self < lower { return lower }
        return self
    }

    /// 限制數值範圍
    /// - note:
    public func confineRange(in range: ClosedRange<Self>) -> Self {
        confineRange(from: range.lowerBound, to: range.upperBound)
    }

    /// 從 Int(64 bit) 轉換為 4 位元組 UInt8 陣列
    /// - Note: 只會轉換 4 個位元組大小。
    /// - Returns: 轉換結果。
    public func to4ByteArray() -> [Byte] {
        var tempNum: UInt32 = UInt32(truncatingIfNeeded: self)
        var tempArr: [Byte] = Array(repeating: 0, count: 4)
        tempNum = CFSwapInt32HostToBig(tempNum)
        for offset in 0 ..< 4 {
            let tempI = offset * 8
            tempArr[offset] = Byte((tempNum & ((0x000000FF) << (tempI))) >> tempI)
        }
        return tempArr
    }

    /// 從 Int(64 bit) 轉換為 8 位元組 UInt8 陣列
    /// - Note: 只會轉換 8 個位元組大小。
    /// - Returns: 轉換結果。
    public func to8ByteArray() -> [Byte] {
        var tempNum: UInt64 = UInt64(truncatingIfNeeded: self)
        var tempArr: [Byte] = Array(repeating: 0, count: 8)
        tempNum = CFSwapInt64HostToBig(tempNum)
        for offset in 0 ..< 8 {
            let tempI = offset * 8
            tempArr[offset] = Byte((tempNum & ((0x000000FF) << tempI)) >> tempI)
        }
        return tempArr
    }

    /// 從 Int(64 Bit) 轉換為 Bool
    /// - parameter mode: 設定 True 的基準。
    /// - Note:
    /// - Returns: 轉換結果。
    public func toBool(mode: Int) -> Bool {
        if mode == 0 {
            if self == 0 {
                return true
            } else {
                return false
            }
        } else {
            if self == 1 {
                return true
            } else {
                return false
            }
        }
    }
}
extension Int: DataConvertible {
    // MARK: DataConvertible
}
