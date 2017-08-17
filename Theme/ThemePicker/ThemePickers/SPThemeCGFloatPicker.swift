//
//  SPThemeCGFloatPicker.swift
//  Theme
//
//  Created by wtj on 2017/8/15.
//  Copyright © 2017年 wtj. All rights reserved.
//

import UIKit

public final class SPThemeCGFloatPicker: SPThemePicker {

    public convenience init(keyPath: String) {
    
        self.init(v: { CGFloat(SPThemeManager.number(forKey: keyPath) ?? 0 )})
    }
    
    public convenience required init(keyPath:String,map: @escaping (Any?) -> CGFloat) {
        self.init(v: {map(SPThemeManager.value(forKey: keyPath))})
    }
    
    public convenience init(floats:CGFloat...) {
    
        self.init(v: {SPThemeManager.element(for: floats)})
    }
    
    public required convenience init(arrayLiteral elements: CGFloat...) {
        self.init(v: { SPThemeManager.element(for: elements)})
    }
    
    public required convenience init(stringLiteral value: String) {
        self.init(keyPath: value)
    }
    
    public required convenience init(unicodeScalarLiteral value: String) {
        self.init(keyPath: value)
    }
    
    public required convenience init(extendedGraphemeClusterLiteral value: String) {
        self.init(keyPath: value)
    }
    
    public class func pickerWithKeyPath(_ keyPath: String) -> SPThemeCGFloatPicker {
    
        return SPThemeCGFloatPicker(keyPath: keyPath)
    }
    
    public class func pickerWithKeyPath(_ keyPath: String,map:@escaping (Any?) -> CGFloat?) -> SPThemeCGFloatPicker {
    
        return SPThemeCGFloatPicker(v: { map(SPThemeManager.value(forKey: keyPath))})
    }
    
    public class func pickerWithFloats(_ floats: [CGFloat]) -> SPThemeCGFloatPicker {
    
        return SPThemeCGFloatPicker(v: {SPThemeManager.element(for: floats)})
    }
    
}

extension SPThemeCGFloatPicker: ExpressibleByArrayLiteral{}
extension SPThemeCGFloatPicker: ExpressibleByStringLiteral{}
