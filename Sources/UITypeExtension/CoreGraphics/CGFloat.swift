//
//  CGFloat.swift
//  DataTypeExtension
//
//  Created by Unpxre on 2019/10/17.
//  Copyright © 2019 Ultracker. All rights reserved.
//
import CoreGraphics
import DataTypeExtension

public extension CGFloat {

    /// 限制數值範圍。
    func confineRange(from low: CGFloat, to high: CGFloat) -> CGFloat {
        let upper = high > low ? high : low
        let lower = high > low ? low : high
        if self > upper { return upper }
        if self < lower { return lower }
        return self
    }
}
