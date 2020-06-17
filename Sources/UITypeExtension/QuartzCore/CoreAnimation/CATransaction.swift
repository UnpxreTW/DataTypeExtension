//
//  CATransaction.swift
//  DataTypeExtension
//
//  Created by Unpxre on 2019/10/21.
//  Copyright © 2019 Ultracker. All rights reserved.
//
import QuartzCore.CoreAnimation

extension CATransaction {

    /// 取消默認隱式動畫
    static func disableAnimation(_ completion: () -> Void) {
        CATransaction.begin()
        CATransaction.setDisableActions(true)
        completion()
        CATransaction.commit()
    }
}
