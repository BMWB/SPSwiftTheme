//
//  SPThemeStatusBarStylePicker.swift
//  Theme
//
//  Created by wtj on 2017/8/16.
//  Copyright © 2017年 wtj. All rights reserved.
//

import UIKit

public final class SPThemeStatusBarStylePicker: SPThemePicker {
    
    var animated = true
    
    public convenience init(keyPath: String) {
        
        self.init(v: { SPThemeStatusBarStylePicker.getStyle(stringStyle:SPThemeManager.string(forKey: keyPath) ?? "")})
    }
    
    public convenience required init(keyPath:String,map: @escaping (Any?) -> UIStatusBarStyle?) {
        self.init(v: { map(SPThemeManager.value(forKey: keyPath))})
    }
    
    public convenience init(styles: UIStatusBarStyle...) {
        self.init(v: { SPThemeManager.element(for: styles)})
    }
    
    public required convenience init(arrayLiteral elements: UIStatusBarStyle...) {
        self.init(v: { SPThemeManager.element(for: elements)})
    }
    
    public required convenience init(stringLiteral value: String) {
        self.init(keyPath: value )
    }
    
    public required convenience init(unicodeScalarLiteral value: String) {
        self.init(keyPath: value)
    }
    
    public class func pickerWithKeyPath(_ keyPath: String) -> SPThemeStatusBarStylePicker {
        
        return SPThemeStatusBarStylePicker(keyPath: keyPath)
    }
    
    public class func pickerWithKeyPath(_ keyPath: String, map: @escaping (Any?) -> UIStatusBarStyle?) -> SPThemeStatusBarStylePicker {
        return SPThemeStatusBarStylePicker(v: { map(SPThemeManager.value(forKey: keyPath))})
    }
    
    public class func pickerWithStyles(_ styles: [UIStatusBarStyle]) -> SPThemeStatusBarStylePicker {
        return SPThemeStatusBarStylePicker(v: { SPThemeManager.element(for: styles)})
    }
    
    public class func pickerWithStringStyles(_ styles: [String]) -> SPThemeStatusBarStylePicker {
    
        return SPThemeStatusBarStylePicker(v: { SPThemeManager.element(for: styles.map(getStyle))})
    }
    
    class func getStyle(stringStyle:String) -> UIStatusBarStyle {
        
        switch stringStyle.lowercased() {
        case "default":
            return .default
        case "lightcontent":
            return .lightContent
        default:
            return .default
        }
    }
}

extension SPThemeStatusBarStylePicker: ExpressibleByArrayLiteral {}
