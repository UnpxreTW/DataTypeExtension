//
//  CGVectorProtocol.swift
//  DataTypeExtension
//
//  Created by Unpxre on 2020/2/13.
//  Copyright © 2020 Unpxre. All rights reserved.
//
import CoreGraphics

public protocol CGVectorProtocol {

    var components: (x: CGFloat, y: CGFloat) { get }

    init(components: (x: CGFloat, y: CGFloat))
}
public extension CGVectorProtocol {

    func applying(operator opt: (CGFloat, CGFloat) -> CGFloat, with vector: CGVectorProtocol) -> Self {
        Self(components: (opt(components.x, vector.components.x), opt(components.y, vector.components.y)))
    }

    func applying(operator opt: (CGFloat, CGFloat) -> CGFloat, with constant: CGFloat) -> Self {
        Self(components: (opt(components.x, constant), opt(components.y, constant)))
    }
}
public extension CGVectorProtocol {

    static func + (lhs: Self, rhs: CGVectorProtocol) -> Self {
        lhs.applying(operator: +, with: rhs)
    }

    static func + (lhs: Self, rhs: CGFloat) -> Self {
        lhs.applying(operator: +, with: rhs)
    }

    static func + (lhs: Self, rhs: Float) -> Self {
        lhs.applying(operator: +, with: CGFloat(rhs))
    }

    static func - (lhs: Self, rhs: CGVectorProtocol) -> Self {
        lhs.applying(operator: -, with: rhs)
    }

    static func - (lhs: Self, rhs: CGFloat) -> Self {
        lhs.applying(operator: -, with: rhs)
    }

    static func * (lhs: Self, rhs: CGFloat) -> Self {
        lhs.applying(operator: *, with: rhs)
    }

    static func * (lhs: Self, rhs: Float) -> Self {
        lhs.applying(operator: *, with: CGFloat(rhs))
    }

    static func / (lhs: Self, rhs: CGFloat) -> Self {
        lhs.applying(operator: /, with: rhs)
    }
}
