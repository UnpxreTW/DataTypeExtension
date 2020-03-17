//
//  UIEdgeInsets.swift
//  DataTypeExtension
//
//  Created by Unpxre on 2019/9/10.
//  Copyright © 2019 Ultracker. All rights reserved.
//
import UIKit

public extension UIEdgeInsets {

    init(length: CGFloat) {
        self.init(top: length, left: length, bottom: length, right: length)
    }
}
