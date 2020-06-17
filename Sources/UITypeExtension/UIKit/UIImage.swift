//
//  UIImage.swift
//  DataTypeExtension
//
//  Created by Unpxre on 2019/8/23.
//  Copyright © 2019 Ultracker. All rights reserved.
//
import UIKit.UIImage

extension UIImage {

    public func reSize(to size: CGSize) -> UIImage? {
        UIGraphicsBeginImageContextWithOptions(size, false, 1)
        self.draw(in: CGRect(origin: .zero, size: size))
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return image
    }

    /// 圖片裁切
    /// - parameter size: 裁切後的大小。
    /// - note: 圖片裁切範圍置中。
    public func splited(by size: CGSize) -> UIImage? {
        UIGraphicsBeginImageContext(size)
        self.draw(in: CGRect(origin: CGPoint((self.size - size) / 2), size: size))
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return image
    }

    /// 等比例缩放
    /// - parameter scaleSize: 縮放比例。
    /// - Returns: 調整大小後的圖片。
    /// - Note:
    public func scaled(by scale: CGFloat) -> UIImage? {
        reSize(to: self.size * scale)
    }
}
