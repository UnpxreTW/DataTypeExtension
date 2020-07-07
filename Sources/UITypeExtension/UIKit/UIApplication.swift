//
//  UIApplication.swift
//  
//
//  Created by Unpxre.tw on 2020/7/7.
//

import UIKit

public protocol AppUtilityProtocol {

    var orientationLock: UIInterfaceOrientationMask { get set }
}

public struct AppUtility {

    public static func lockOrientation(_ orientation: UIInterfaceOrientationMask) {
        if var delegate = UIApplication.shared.delegate as? AppUtilityProtocol {
            delegate.orientationLock = orientation
        }
    }

    public static func lockOrientation(
        _ orientation: UIInterfaceOrientationMask,
        andRotateTo rotateOrientation: UIInterfaceOrientation
    ) {
        self.lockOrientation(orientation)
        UIDevice.current.setValue(rotateOrientation.rawValue, forKey: "orientation")
    }
}
