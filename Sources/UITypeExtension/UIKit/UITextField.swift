//
//  UITextField.swift
//  DataTypeExtension
//
//  Created by Unpxre on 2019/10/2.
//  Copyright © 2019 Ultracker. All rights reserved.
//
import UIKit.UITextField

extension UITextField {

    public convenience init(keyboardType: UIKeyboardType) {
        self.init()
        self.keyboardType = keyboardType
    }

    public convenience init(isSecureTextEntry: Bool) {
        self.init()
        self.isSecureTextEntry = isSecureTextEntry
    }
}
