//
//  UInt8.swift
//  DataTypeExtension
//
//  Created by Unpxre on 2019/11/15.
//  Copyright © 2019 Unpxre. All rights reserved.
//

/// 從任意類型轉換 Byte 陣列
/// - Parameter value: 任意類型變數。
/// - Returns: 轉換後的 Byte 陣列。
/// - Note: 大小為原始變數類型的原始大小。
private func bytes<T>(of value: T) -> [Byte] {
    var value = value
    let size = MemoryLayout<T>.size
    return withUnsafePointer(to: &value) {
        $0.withMemoryRebound(to: Byte.self, capacity: size) {
            Array(UnsafeBufferPointer(start: $0, count: size))
        }
    }
}
