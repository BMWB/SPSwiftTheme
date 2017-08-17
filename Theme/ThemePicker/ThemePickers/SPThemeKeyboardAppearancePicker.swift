//
//  SPThemeKeyboardAppearancePicker.swift
//  Theme
//
//  Created by wtj on 2017/8/17.
//  Copyright © 2017年 wtj. All rights reserved.
//

import UIKit

public final class SPThemeKeyboardAppearancePicker: SPThemePicker {
    
    public convenience init(keyPath: String) {
        
        self.init(v: {SPThemeKeyboardAppearancePicker.getStyle(stringStyle: SPThemeManager.string(forKey: keyPath) ?? "")})
    }
    
    public convenience init(keyPath: String, map: @escaping (Any?) -> UIKeyboardAppearance?) {
        self.init(v: { map(SPThemeManager.value(forKey: keyPath))})
    }
    
    public convenience init(styles: UIKeyboardAppearance...) {
        
        self.init(v: { SPThemeManager.element(for: styles)})
    }
    
    public required convenience init(arrayLiteral elements: UIKeyboardAppearance...) {
        
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
    
    public class func pickerWithKeyPath(_ keyPath: String) -> SPThemeKeyboardAppearancePicker {
        return SPThemeKeyboardAppearancePicker(keyPath: keyPath)
    }
    
    public class func pickerWithKeyPath(_ keyPath: String,map: @escaping (Any?) -> UIKeyboardAppearance?) -> SPThemeKeyboardAppearancePicker {
    
        return SPThemeKeyboardAppearancePicker(v: { map(SPThemeManager.value(forKey: keyPath))})
    }
    
    public class func pickerWithStyles(_ styles: [UIKeyboardAppearance]) -> SPThemeKeyboardAppearancePicker {
        return SPThemeKeyboardAppearancePicker(v: {SPThemeManager.element(for: styles)})
    }
    
    public class func pickerWithStringStyles(_ styles: [String]) -> SPThemeKeyboardAppearancePicker {
        return SPThemeKeyboardAppearancePicker(v: {SPThemeManager.element(for: styles.map(getStyle))})
    }
    
    
    class func getStyle(stringStyle: String) -> UIKeyboardAppearance {
        switch stringStyle.lowercased() {
        case "default":
            return .default
        case "dark"   :
            return .dark
        case "light"  :
            return .light
        default:
            return .default
        }
    }
}

extension SPThemeKeyboardAppearancePicker: ExpressibleByArrayLiteral {}
extension SPThemeKeyboardAppearancePicker: ExpressibleByStringLiteral {}
