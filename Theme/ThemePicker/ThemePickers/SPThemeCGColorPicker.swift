//
//  SPThemeCGColorPicker.swift
//  Theme
//
//  Created by wtj on 2017/8/17.
//  Copyright © 2017年 wtj. All rights reserved.
//

import Foundation
import CoreGraphics.CGColor

public final class SPThemeCGColorPicker: SPThemePicker {
    
    public convenience init(keyPath: String) {
        
        self.init(v: { SPThemeManager.color(for: keyPath)?.cgColor})
    }
    
    public convenience init(keyPath: String, map: @escaping (Any?) ->CGColor?) {
        
        self.init(v: { map(SPThemeManager.value(forKey: keyPath))})
    }
    
    public convenience init(colors: String...) {
        self.init(v: { SPThemeManager.colorElemet(for: colors)?.cgColor})
    }
    
    public required convenience init(arrayLiteral elements:String...) {
        self.init(v: { SPThemeManager.colorElemet(for: elements)?.cgColor})
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
    
    public class func pickerWithKeyPath(_ keyPath: String) -> SPThemeCGColorPicker {
        return SPThemeCGColorPicker(keyPath: keyPath)
    }
    
    public class func pickerWithKeyPath(_ keyPath: String, map: @escaping (Any?) -> CGColor) -> SPThemeCGColorPicker {
        return SPThemeCGColorPicker(v: { map(SPThemeManager.value(forKey: keyPath))})
    }
    
    public class func pickerWithColors(_ colors: [String]) -> SPThemeCGColorPicker {
        return SPThemeCGColorPicker(v: {SPThemeManager.colorElemet(for: colors)?.cgColor})
    }
    
}
