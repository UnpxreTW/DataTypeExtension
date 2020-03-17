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
    ///     - length: 擷取長度。
    /// - Returns:
    /// - Note: 預設擷取 4 Bytes。
    public func getExcerpt(from location: Int, byLength length: Int = 4) -> Data {
        var offset = length
        if location + offset > self.count {
            offset = self.count - location
        }
        return self.subdata(in: location ..< location + offset)
    }
}
