//
//  SPThemeManager.swift
//  Theme
//
//  Created by wtj on 2017/8/15.
//  Copyright © 2017年 wtj. All rights reserved.
//

import UIKit
import Foundation

public let ThemeUpdateNotification = "ThemeUpdateNotification"

public enum ThemePath {

    case mainBundle
    case sanbox(Foundation.URL)
    
    public var URL: Foundation.URL? {
        switch self {
        case .mainBundle:
            return nil
        case .sanbox(let path):
            return path
        }
    }
    
    public func plistPath(name: String) -> String? {
        switch self {
        case .mainBundle:
            return Bundle.main.path(forResource: name, ofType: "plist")
        case .sanbox(let path):
            let name = name.hasSuffix(".plist") ? name : name + ".plist"
            return Foundation.URL(string: name, relativeTo: path)?.path
            
        }
    }
}

public final class SPThemeManager: NSObject {

    public static var animationDuration = 0.3
    
    public fileprivate(set) static var currentTheme : NSDictionary?
    
    public fileprivate(set) static var currentThemePath : ThemePath?
    
    public fileprivate(set) static var currentThemeIndex : Int = 0
    
    public class func setTheme(index: Int) {
    
        currentThemeIndex = index
        
        NotificationCenter.default.post(name: Notification.Name(rawValue:ThemeUpdateNotification), object: nil)
    }
    
    public class func setTheme(plistName:String, path: ThemePath) {
    
        guard let plistPath = path.plistPath(name: plistName) else {
            print("SwiftTheme WARNING: Not find plist '\(plistName)' with: \(path)")
            return
        }
        
        guard let plistDict = NSDictionary(contentsOfFile:plistPath) else {
            print("SwiftTheme WARNING: Not read plist '\(plistName)' with: \(plistPath)")
            return
        }
        
        self.setTheme(dict: plistDict, path: path)
    }
    
    public class func setTheme(dict:NSDictionary, path: ThemePath) {
    
        currentTheme = dict
        currentThemePath = path
        
        NotificationCenter.default.post(name: Notification.Name(rawValue:ThemeUpdateNotification), object: nil)
    }
}
