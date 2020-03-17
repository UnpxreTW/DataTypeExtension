//
//  CALayer.swift
//  DataTypeExtension
//
//  Created by Unpxre on 2019/10/21.
//  Copyright © 2019 Ultracker. All rights reserved.
//
import QuartzCore.CoreAnimation

extension CALayer {

    func removeAllSubLayer() {
        self.sublayers?.forEach { $0.removeFromSuperlayer() }
    }
}
