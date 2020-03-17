//
//  UISegmentedControl.swift
//  DataTypeExtension
//
//  Created by Unpxre on 2019/11/4.
//  Copyright © 2019 Unpxre. All rights reserved.
//
import UIKit.UISegmentedControl

extension UISegmentedControl {

    public var allTitles: [String] {
        var allTitles: [String] = []
        for index in 0 ..< self.numberOfSegments {
            guard let title = self.titleForSegment(at: index) else { continue }
            allTitles.append(title)
        }
        return allTitles
    }
}
