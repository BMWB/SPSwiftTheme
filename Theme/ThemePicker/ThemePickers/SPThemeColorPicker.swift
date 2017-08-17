 //
//  SPThemeColorPicker.swift
//  Theme
//
//  Created by wtj on 2017/8/17.
//  Copyright © 2017年 wtj. All rights reserved.
//

import UIKit

public final class SPThemeColorPicker: SPThemePicker {

    public convenience init(keyPath: String) {
    
        self.init(v: {SPThemeManager.color(for: keyPath)})
    }
    
    public convenience init(keyPath: String ,map: @escaping (Any?) -> UIColor?) {
        self.init(v: { map(SPThemeManager.value(forKey: keyPath))})
        
    }
    
    public convenience init(colors: String...) {
        self.init(v: { SPThemeManager.colorElemet(for: colors)})
    }
    
    public required convenience init(arrayLiteral elements: String...) {
        self.init(v: { SPThemeManager.colorElemet(for: elements)})
    }
    
    public required convenience init(stringLiteral value: String) {
        self.init(keyPath: value)
    }
    
    public required convenience init(unicoeScalarLiteral value: String) {
        self.init(keyPath: value)
    }
    
    public required convenience init(extendedGraphemeClusterLiteral value: String) {
        self.init(keyPath: value)
    }
    
    public class func pickerWithKeyPath(_ keyPath: String) -> SPThemeColorPicker {
        return SPThemeColorPicker(keyPath: keyPath)
    }
    
    public class func pickerWithKeyPath(_ keyPath: String,map: @escaping (Any?) -> UIColor?) -> SPThemeColorPicker {
        return SPThemeColorPicker(v: { map(SPThemeManager.value(forKey: keyPath))})
    }
    
    public class func pickerWithColors(_ colors: [String]) -> SPThemeColorPicker {
        return SPThemeColorPicker(v: {SPThemeManager.colorElemet(for: colors)})
    }
}
