//
//  SPThemeBarStylePicker.swift
//  Theme
//
//  Created by wtj on 2017/8/17.
//  Copyright © 2017年 wtj. All rights reserved.
//

import UIKit

public final class SPThemeBarStylePicker: SPThemePicker {

    public convenience init(keyPath: String) {
    
        self.init(v: { SPThemeBarStylePicker.getStyle(stringStyle: SPThemeManager.string(forKey: keyPath) ?? "")})
    }
    
    public convenience init(keyPath: String,map: @escaping (Any?) -> UIBarStyle?) {
    
        self.init(v: { map(SPThemeManager.value(forKey: keyPath)) })
    }

    public convenience init(styles: UIBarStyle...) {
    
        self.init(v: { SPThemeManager.element(for: styles)})
    }
    
    public required convenience init(arrayLiteral elements: UIBarStyle...) {
    
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
    
    public class func pickerWithKeyPath(_ keyPath:String) -> SPThemeBarStylePicker {
    
        return SPThemeBarStylePicker(keyPath: keyPath)
    }
    
    public class func pickerWithKeyPath(_ keyPath: String, map: @escaping (Any?) -> UIBarStyle?) -> SPThemeBarStylePicker {
        return SPThemeBarStylePicker(v: { map(SPThemeManager.value(forKey: keyPath))})
    }
    
    public class func pickerWithStyles(_ styles: [UIBarStyle]) -> SPThemeBarStylePicker {
    
        return SPThemeBarStylePicker(v: { SPThemeManager.element(for: styles)})
    }
    
    public class func pickerWithStringStyles(_ styles: [String]) -> SPThemeBarStylePicker {
    
        return SPThemeBarStylePicker(v: {SPThemeManager.element(for: styles)})
    }
    
    class func getStyle(stringStyle: String) -> UIBarStyle {
        switch stringStyle.lowercased() {
        case "default":
            return .default
        case "black":
            return .black
        default:
            return .default
        }
    }
}
