//
//  String.swift
//  DataTypeExtension
//
//  Created by Unpxre on 2019/9/26.
//  Copyright © 2019 Ultracker. All rights reserved.
//
import Foundation

extension String {

    /// 根據輸入範圍裁切字串。
    /// - Parameter start: 起始字元索引值，必須大於 0 並小於結束字元索引值。
    /// - Parameter end: 結束字元索引值，必須大於起始字元索引值，如果沒有值則預設為字串長度。
    /// - Returns: 裁切後的字串，如果長度不足則回傳可使用最大長度。
    /// - Note: Index 從 1 開始。
    public func sliceByIndex(_ start: Int, to end: Int?) -> String {
        var end = end.isNone ? self.count : end.or(0)
        guard start > 0, start <= self.count, end >= start else { return "" }
        if self.count < end { end = self.count }
        let startIndex = self.index(self.startIndex, offsetBy: start - 1)
        let endIndex = self.index(self.startIndex, offsetBy: end)
        return String(self[startIndex ..< endIndex])
    }

    public func checkNumberCount(is count: Int) -> Bool {
        guard self.count == count else { return false }
        let character = CharacterSet(charactersIn: "0123456789")
        let characters = self.trimmingCharacters(in: character.inverted)
        guard characters.count == count else { return false }
        return true
    }

    public var isUsablePort: Bool {
        let character = CharacterSet(charactersIn: "0123456789")
        let characters = self.trimmingCharacters(in: character.inverted)
        guard let integer = Int(characters) else { return false }
        guard integer >= 1024, integer <= 65535 else { return false }
        return true
    }

    public var isIPAddress: Bool {
        let array = self.components(separatedBy: ".").compactMap { Int($0) }
        guard array.count == 4 else { return false }
        for integer in array {
            guard integer >= 0, integer <= 255 else { return false }
        }
        return true
    }
}

import UIKit

extension String {

    public func textLenght(byFont font: UIFont) -> CGFloat {
        self.size(withAttributes: [NSAttributedString.Key.font: font]).width
    }
}
