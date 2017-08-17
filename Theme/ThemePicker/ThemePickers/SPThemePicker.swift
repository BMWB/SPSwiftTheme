//
//  SPThemePicker.swift
//  Theme
//
//  Created by wtj on 2017/8/15.
//  Copyright © 2017年 wtj. All rights reserved.
//

import UIKit

public class SPThemePicker: NSObject {

    public typealias ValueType = () -> Any?
    
    var value : ValueType
    
    required public init(v: @escaping ValueType) {
        value = v
    }
    
    public func copy(with zone:NSZone?) -> Any {
        return type(of: self).init(v: value)
    }
}
