//
//  Sequence.swift
//  
//
//  Created by Unpxre.tw on 2020/7/7.
//

extension Sequence {

    /// 編號序列內的內容物。
    /// - Returns: 包含 (Int, Element) 的陣列。
    public func numbered(startingAt start: Int = 1) -> [(number: Int, element: Element)] {
        Array(zip(start..., self))
    }

    public func numbered(startingAt start: Int = 1) -> [Numbered<Element>] {
        zip(start..., self).map { Numbered(number: $0.0, element: $0.1) }
    }
}

extension Sequence where Iterator.Element == Byte {

    /// 從 UInt8 陣列轉換為 UInt32。
    /// - Note: 只會轉換前 4 個位元組，陣列長度必須大於 4 位元組，否則回傳零。
    /// - Returns: 轉換結果。
    public func toUInt32() -> UInt32 {
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
    public func toUInt32ToInt() -> Int { Int(self.toUInt32()) }

    /// 從 UInt8 陣列轉換為 Int(64 bit)。
    /// - Note: 只會轉換前 8 個位元組，陣列長度必須大於 8 位元組，否則回傳零。
    /// - Returns: 轉換結果。
    public func toInt() -> Int {
        if self.reversed().count < 8 { return 0 }
        var tempNumber: Int = 0
        for offset in 0 ..< 8 {
            tempNumber += Int(self.reversed()[offset]) << (offset * 8)
        }
        return tempNumber
    }
}

@dynamicMemberLookup
public struct Numbered<Element> {

    public var number: Int

    public var element: Element

    public subscript<Type>(dynamicMember keyPath: WritableKeyPath<Element, Type>) -> Type {
        get { element[keyPath: keyPath] }
        set { element[keyPath: keyPath] = newValue }
    }
}
@available(iOS 13, *)
extension Numbered: Identifiable where Element: Identifiable {

    public var id: Element.ID { element.id }
}
