//
//  UIColor.swift
//  DataTypeExtension
//
//  Created by Unpxre on 2019/11/15.
//  Copyright © 2019 Unpxre. All rights reserved.
//
import UIKit.UIColor

extension UIColor {

    public convenience init(red: Int, green: Int, blue: Int) {
        self.init(red: CGFloat(red) / 255, green: CGFloat(green) / 255, blue: CGFloat(blue) / 255, alpha: 1)
    }
}
