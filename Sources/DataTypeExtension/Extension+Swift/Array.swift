//
//  Array.swift
//  DataTypeExtension
//
//  Created by Unpxre on 2019/11/15.
//  Copyright © 2019 Unpxre. All rights reserved.
//

extension Array {

    public mutating func removeElementByReference(_ element: Element) {
        guard let objIndex = firstIndex(where: {
            $0 as AnyObject === element as AnyObject }
        ) else {
            return
        }
        remove(at: objIndex)
    }
}

public extension Sequence where Iterator.Element == Byte {

    /// 從 UInt8 陣列轉換為 UInt32。
    /// - Note: 只會轉換前 4 個位元組，陣列長度必須大於 4 位元組，否則回傳零。
    /// - Returns: 轉換結果。
    func toUInt32() -> UInt32 {
        if self.reversed().count < 4 { return 0 }
        var tempNumber: UInt32 = 0
        for offset in 0 ..< 4 {
            tempNumber += UInt32(self.reversed()[offset]) << (offset * 8)
        }
        return tempNumber
    }

    ///  從 UInt8 轉換為 UInt32 後在轉換為 Int(64 bit)。
    /// - Note: 只會轉換前 4 個位元組，陣列長度必須大於 4 位元組，否則回傳零。
    /// - Returns: 轉換結果。
    func toUInt32ToInt() -> Int { Int(self.toUInt32()) }

    /// 從 UInt8 陣列轉換為 Int(64 bit)。
    /// - Note: 只會轉換前 8 個位元組，陣列長度必須大於 8 位元組，否則回傳零。
    /// - Returns: 轉換結果。
    func toInt() -> Int {
        if self.reversed().count < 8 { return 0 }
        var tempNumber: Int = 0
        for offset in 0 ..< 8 {
            tempNumber += Int(self.reversed()[offset]) << (offset * 8)
        }
        return tempNumber
    }
}
