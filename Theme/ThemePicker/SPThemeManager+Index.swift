//
//  SPThemeManager+Index.swift
//  Theme
//
//  Created by wtj on 2017/8/15.
//  Copyright © 2017年 wtj. All rights reserved.
//

import UIKit

extension SPThemeManager {


    public class func colorElemet(for array: [String]) -> UIColor? {
    
        guard let rgba = element(for: array)  else { return nil }
        guard let color = try? UIColor(rgba_throws: rgba as String) else {
        
            print("SwiftTheme WARNING: Not convert rgba \(rgba) in array: \(array)[\(currentThemeIndex)]")
            return nil
        }
        
        return color
    }
    
    public class func imageElement(for array: [String]) -> UIImage? {
    
        guard let imageName = element(for: array) else { return nil }
        
        guard let image = UIImage(named: imageName as String) else {
            
            print("SwiftTheme WARNING: Not found image name '\(imageName)' in array: \(array)[\(currentThemeIndex)]")
            
            return nil
            
        }
        
        return image
    }
    
    public class func element<T>(for array: [T]) -> T? {
    
        let index = SPThemeManager.currentThemeIndex
        
        guard array.indices ~= index else {
            print("SwiftTheme WARNING: Not found element in array: \(array)[\(currentThemeIndex)]")
            return nil
        }
        
        return array[index]
    }
}
