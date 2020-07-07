//
//  Array.swift
//  DataTypeExtension
//
//  Created by Unpxre on 2019/11/15.
//  Copyright © 2019 Unpxre. All rights reserved.
//

extension Array {

    public mutating func removeElementByReference(_ element: Element) {
        guard let objIndex = firstIndex(where: {
            $0 as AnyObject === element as AnyObject }
        ) else {
            return
        }
        remove(at: objIndex)
    }
}
