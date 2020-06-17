//
//  CGSize.swift
//  DataTypeExtension
//
//  Created by Unpxre on 2019/8/22.
//  Copyright © 2019 Ultracker. All rights reserved.
//
import CoreGraphics
import DataTypeExtension

extension CGSize {

    /// 矩形的中心點座標
    public var centerPoint: CGPoint {
        CGPoint(x: self.width / 2, y: self.height / 2)
    }

    /// 產生一個邊長為 length 的矩形
    /// - Parameter length: 矩形的邊長。
    public init(length: CGFloat) {
        self.init(width: length, height: length)
    }

    public mutating func change(width: CGFloat? = nil, height: CGFloat? = nil) {
        self.width = width.or(self.width)
        self.height = height.or(self.height)
    }

    public func changed(width: CGFloat? = nil, height: CGFloat? = nil) -> Self {
        return Self(width: width.or(self.width), height: height.or(self.height))
    }

    public static func += (lhs: inout Self, rhs: Self) {
        lhs = rhs + lhs
    }
}
extension CGSize: CGVectorProtocol {

    public var components: (x: CGFloat, y: CGFloat) { (width, height) }

    public init(components: (x: CGFloat, y: CGFloat)) { self.init(width: components.x, height: components.y) }
}
