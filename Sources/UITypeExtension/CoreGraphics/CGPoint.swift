//
//  CGPoint.swift
//  DataTypeExtension
//
//  Created by Unpxre on 2019/8/23.
//  Copyright © 2019 Ultracker. All rights reserved.
//
import CoreGraphics

extension CGPoint {

    public init(length: CGFloat) {
        self.init(x: length, y: length)
    }

    public init(_ size: CGSize) {
        self.init(x: size.width, y: size.height)
    }

//    public static func - (lhs: Self, rhs: CGFloat) -> Self {
//        return Self(x: lhs.x - rhs, y: lhs.y - rhs)
//    }

//    public static func * (lhs: Self, rhs: Float) -> Self {
//        Self(x: lhs.x * CGFloat(rhs), y: lhs.y * CGFloat(rhs))
//    }
//
//    public static func * (lhs: Self, rhs: CGFloat) -> Self {
//        return Self(x: lhs.x * rhs, y: lhs.y * rhs)
//    }

    public static func *= (lhs: inout Self, rhs: CGFloat) {
        lhs = Self(x: lhs.x * rhs, y: lhs.y * rhs)
    }

    public static func / (lhs: Self, rhs: CGSize) -> Self {
        Self(x: lhs.x / rhs.width, y: lhs.y / rhs.height)
    }

    public func isInThe(area: CGRect?) -> Bool {
        guard
            let area = area,
            self.x >= area.origin.x,
            self.y >= area.origin.y,
            self.x <= area.origin.x + area.width,
            self.y <= area.origin.y + area.height
        else { return false }
        return true
    }
}
extension CGPoint: CGVectorProtocol {

    public var components: (x: CGFloat, y: CGFloat) { (x, y) }

    public init(components: (x: CGFloat, y: CGFloat)) { self.init(x: components.x, y: components.y) }
}
