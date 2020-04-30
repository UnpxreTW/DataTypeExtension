//
//  Data.swift
//  
//
//  Created by Unpxre on 2020/3/17.
//

import Foundation

public protocol DataConvertible {

    init(data: Data)
}

extension DataConvertible where Self: ExpressibleByIntegerLiteral {

    public init(data: Data) {
        var value: Self = 0
        guard data.count == MemoryLayout.size(ofValue: value) else {
            self = 0
            return
        }
        _ = withUnsafeMutableBytes(of: &value, { data.copyBytes(to: $0) })
        self = value
    }
}

extension Data {

    public init<T>(from value: T, bySize size: Int? = nil, isBigEndian: Bool = false) {
        var tempData: Data = .init()
        tempData = Swift.withUnsafeBytes(of: value) { Data($0) }
        if let size = size {
            let valueSize = MemoryLayout.size(ofValue: value)
            if size > valueSize {
                tempData.append(contentsOf: Array(
                    repeating: 0,
                    count: size - valueSize)
                )
            } else {
                tempData = tempData.subdata(in: 0 ..< size)
            }
        }
        if isBigEndian { tempData.reverse() }
        self = tempData
    }

    /// 取得 Data 片段。
    /// - Parameters:
    ///     - location: 起點。
    ///     - length: 擷取長度預設擷取 4 Bytes。
    /// - Note: 當長度不足則返回 nil 。
    public func getExcerpt(from location: Int, byLength length: Int = 4) -> Data? {
        guard location + length <= count else { return nil }
        return self.subdata(in: location ..< location + length)
    }
}
