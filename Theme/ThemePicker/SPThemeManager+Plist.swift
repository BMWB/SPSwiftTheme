//
//  SPThemeManager+Plist.swift
//  Theme
//
//  Created by wtj on 2017/8/15.
//  Copyright © 2017年 wtj. All rights reserved.
//

import UIKit

extension SPThemeManager {

    public override class func value(forKey key: String) -> Any? {
        return currentTheme?.value(forKey:key)
    }
    
    public class func string(forKey key: String) -> String? {
        guard let string = currentTheme?.value(forKey: key) as? String else {
            print("SwiftTheme WARNING: Not found string key path: \(key)")
            return nil
        }
        
        return string
    }
    
    public class func number(forKey key: String) -> NSNumber? {
        guard let number = currentTheme?.value(forKey: key) as? NSNumber else {
            print("SwiftTheme WARNING: Not found number key path: \(key)")
            return nil
        }
        
        return number
    }
    
    public class func dictionary(forKey key: String) -> NSDictionary? {
        guard let dict = currentTheme?.value(forKeyPath: key) as? NSDictionary else {
            print("SwiftTheme WARNING: Not found dictionary key path: \(key)")
            return nil
        }
        return dict
    }
    
    public class func color(for keyPath: String) -> UIColor? {
    
        guard let rgba = string(forKey: keyPath) else { return nil }
        
        guard let color = try? UIColor(rgba_throws: rgba) else {
            print("SwiftTheme WARNING: Not convert rgba \(rgba) at key path: \(keyPath)")
            return nil
        }
        
        return color
    }
    
    public class func image(forKey key: String) -> UIImage? {
        guard let imageName = string(forKey: key) else { return nil }
        
        if let filePath = currentThemePath?.URL?.appendingPathComponent(imageName).path {
            guard let image = UIImage(contentsOfFile: filePath) else {
                print("SwiftTheme WARNING: Not found image at file path: \(filePath)")
                return nil
            }
            return image
        } else {
            guard let image = UIImage(named: imageName) else {
                print("SwiftTheme WARNING: Not found image name at main bundle: \(imageName)")
                return nil
            }
            return image
        }
    }
    
}
