//
//  NSObject+Theme.swift
//  Theme
//
//  Created by wtj on 2017/8/16.
//  Copyright © 2017年 wtj. All rights reserved.
//

import UIKit

extension NSObject {

    typealias ThemePickers = [String: SPThemePicker]
    
    var themePickers: ThemePickers {
        get {
        
            if let themePickers = objc_getAssociatedObject(self, &themePickersKey) as? ThemePickers {
                return themePickers
            }
            
            let initValue = ThemePickers()
            
            objc_setAssociatedObject(self, &themePickersKey, initValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
            
            return initValue

        }
        
        set {
        
            objc_setAssociatedObject(self, &themePickersKey, newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
            
            _removeThemeNotification()
            if newValue.isEmpty == false {
                _setupThemeNotification()
            }
        }
    }
    
    func performThemePicker(selector: String,picker: SPThemePicker?) {
        let sel = Selector(selector)
        
        guard responds(to: sel)           else { return }
        guard let value = picker?.value() else { return }
        
        if let statePicker = picker as? SPThemeStatePicker {
            let setState = unsafeBitCast(method(for: sel), to: setValueForStateIMP.self)
            statePicker.values.forEach({ setState(self,sel, $1.value()! as AnyObject,UIControlState(rawValue: $0))})
        } else if let statusBarStylePicker = picker as? SPThemeStatusBarStylePicker {
            let setStatusBarStyle = unsafeBitCast(method(for: sel), to: setStatusBarStyleValueIMP.self)
            setStatusBarStyle(self, sel, value as! UIStatusBarStyle, statusBarStylePicker.animated)
            
        } else if picker is SPThemeBarStylePicker {
        
            let  setBarStyle = unsafeBitCast(method(for: sel), to: setBarStyleValueIMP.self)
            setBarStyle(self, sel, value as! UIBarStyle)
            
        } else if picker is SPThemeKeyboardAppearancePicker {
        
            let  setKeyboard = unsafeBitCast(method(for: sel), to: setKeyboardValueIMP.self)
            setKeyboard(self, sel, value as! UIKeyboardAppearance)
            
        } else if picker is SPThemeActivityIndicatorViewStylePicker {
            let  setActivityStyle = unsafeBitCast(method(for: sel), to: setActivityStyleValueIMP.self)
            setActivityStyle(self, sel, value as! UIActivityIndicatorViewStyle)
            
        } else if picker is SPThemeCGFloatPicker {
            let setCGFloat = unsafeBitCast(method(for: sel), to: setCGFloatValueIMP.self)
            setCGFloat(self, sel, value as! CGFloat)
            
        } else if picker is SPThemeCGColorPicker {
            let setCGColor = unsafeBitCast(method(for: sel), to: setCGColorValueIMP.self)
            setCGColor(self, sel, value as! CGColor)
            
        } else {
        
            perform(sel, with: value)
        }
    }
    
    fileprivate typealias setCGColorValueIMP            = @convention(c) (NSObject, Selector, CGColor) -> Void
    fileprivate typealias setCGFloatValueIMP            = @convention(c) (NSObject, Selector, CGFloat) -> Void
    fileprivate typealias setValueForStateIMP           = @convention(c) (NSObject, Selector, AnyObject, UIControlState) -> Void
    fileprivate typealias setKeyboardValueIMP           = @convention(c) (NSObject, Selector, UIKeyboardAppearance) -> Void
    fileprivate typealias setActivityStyleValueIMP      = @convention(c) (NSObject, Selector, UIActivityIndicatorViewStyle) -> Void
    fileprivate typealias setBarStyleValueIMP           = @convention(c) (NSObject, Selector, UIBarStyle) -> Void
    fileprivate typealias setStatusBarStyleValueIMP     = @convention(c) (NSObject, Selector, UIStatusBarStyle,Bool) -> Void
}

extension NSObject {
    
    fileprivate func _setupThemeNotification() {
    
        if #available(iOS 9.0, *) {
            NotificationCenter.default.addObserver(self, selector: #selector(_updateTeme), name: NSNotification.Name(rawValue:ThemeUpdateNotification), object: nil)
        } else {
            NotificationCenter.default.addObserver(forName: NSNotification.Name(rawValue:ThemeUpdateNotification), object: nil, queue: nil, using: { [weak self] notification in
                self?._updateTeme()
            })
        }
    }
    
    fileprivate func _removeThemeNotification() {
        NotificationCenter.default.removeObserver(self, name:NSNotification.Name(rawValue:ThemeUpdateNotification), object: nil)
    }
    
    @objc private func _updateTeme() {
    
        themePickers.forEach { (selector,picker) in
            UIView.animate(withDuration: 0.25, animations: { 
                self.performThemePicker(selector: selector, picker: picker)
            })
        }
    }
}
private var themePickersKey = ""
