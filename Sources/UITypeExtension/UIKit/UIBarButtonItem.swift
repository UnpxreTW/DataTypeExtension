//
//  UIBarButtonItem.swift
//  DataTypeExtension
//
//  Created by Unpxre on 2019/10/14.
//  Copyright © 2019 Ultracker. All rights reserved.
//
import UIKit.UIBarButtonItem

public extension UIBarButtonItem {

    convenience init(systemItem type: UIBarButtonItem.SystemItem) {
        self.init(barButtonSystemItem: type, target: nil, action: nil)
    }

    convenience init(fixedWidth: CGFloat) {
        self.init(barButtonSystemItem: .fixedSpace, target: nil, action: nil)
        width = fixedWidth
    }

    convenience init(image: UIImage?, target: Any?, action: Selector?) {
        self.init(image: image, style: .plain, target: target, action: action)
    }

    convenience init(title: String, target: Any?, action: Selector?) {
        self.init(title: title, style: .plain, target: target, action: action)
    }
}
