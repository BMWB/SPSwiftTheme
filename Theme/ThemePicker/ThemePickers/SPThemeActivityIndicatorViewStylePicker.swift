//
//  SPThemeActivityIndicatorViewStylePicker.swift
//  Theme
//
//  Created by wtj on 2017/8/17.
//  Copyright © 2017年 wtj. All rights reserved.
//

import UIKit

public final class SPThemeActivityIndicatorViewStylePicker: SPThemePicker {
    
    public convenience init(keyPath: String) {
        
        self.init(v: { SPThemeActivityIndicatorViewStylePicker.getStyle(stringStryle: SPThemeManager.string(forKey: keyPath) ?? "")})
    }
    
    public convenience init(keyPath: String, map: @escaping (Any?) -> UIActivityIndicatorViewStyle?) {
        self.init(v: { map(SPThemeManager.value(forKey: keyPath))})
    }
    
    public convenience init(styles: UIActivityIndicatorViewStyle...) {
        self.init(v: { SPThemeManager.element(for: styles)})
    }
    
    public required convenience init(arrayLiteral elements:UIActivityIndicatorViewStyle...) {
        self.init(v: { SPThemeManager.element(for: elements)})
    }
    
    public required convenience init(stringLiteral value: String) {
        self.init(keyPath: value)
    }
    
    public required convenience  init(unicodeScalarLiteral value: String) {
        self.init(keyPath: value)
    }
    
    public required convenience init(extendedGraphemeClusterLiteral value: String) {
        self.init(keyPath: value)
    }
    
    public class func pikerWithKeyPath(_ keyPath: String) -> SPThemeActivityIndicatorViewStylePicker {
        return SPThemeActivityIndicatorViewStylePicker(keyPath: keyPath)
    }
    
    public class func pickerWithKeyPath(_ keyPath: String, map: @escaping (Any?) -> UIActivityIndicatorViewStyle?) -> SPThemeActivityIndicatorViewStylePicker {
        return SPThemeActivityIndicatorViewStylePicker(v: {map(SPThemeManager.value(forKey: keyPath))})
    }
    
    public class func pickerWithStyles(_ styles: [UIActivityIndicatorViewStyle]) -> SPThemeActivityIndicatorViewStylePicker {
        return SPThemeActivityIndicatorViewStylePicker(v: {SPThemeManager.element(for: styles)})
    }
    
    public class func pickerWithStyles(_ styles: [String]) -> SPThemeActivityIndicatorViewStylePicker {
        return SPThemeActivityIndicatorViewStylePicker(v: {SPThemeManager.element(for: styles.map(getStyle))})
    }
    
    
    class func getStyle(stringStryle:String) -> UIActivityIndicatorViewStyle {
        switch stringStryle.lowercased() {
        case "gray":
            return .gray
        case "white":
            return .white
        case "whitelarge":
            return .whiteLarge
        default:
            return .gray
        }
    }
}
