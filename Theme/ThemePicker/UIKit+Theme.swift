//
//  UIKit+Theme.swift
//  Theme
//
//  Created by wtj on 2017/8/16.
//  Copyright © 2017年 wtj. All rights reserved.
//

import UIKit

extension UIView {
    
    public var theme_alpha: SPThemeCGFloatPicker? {
        
        get { return getThemePicker(self, "setAlpha:") as? SPThemeCGFloatPicker }
        set { setThemePicker(self, "setAlpha:", newValue) }
    }
    
    public var theme_backgroundColor: SPThemeColorPicker? {
        get { return getThemePicker(self, "setBackgroundColor:") as? SPThemeColorPicker }
        set { setThemePicker(self, "setBackgroundColor:", newValue)}
    }
    
    public var theme_tintColor: SPThemeColorPicker? {
    
        get { return getThemePicker(self, "setTintColor:") as? SPThemeColorPicker}
        set { setThemePicker(self, "setTintColor:", newValue)}
    }
}

extension UIApplication
{
    public func theme_setStatusBarStyle(_ picker: SPThemeStatusBarStylePicker, animated: Bool) {
        picker.animated = animated
        setThemePicker(self, "setStatusBarStyle:animated:", picker)
    }
}
extension UIBarButtonItem
{
    public var theme_tintColor: SPThemeColorPicker? {
        get { return getThemePicker(self, "setTintColor:") as? SPThemeColorPicker }
        set { setThemePicker(self, "setTintColor:", newValue) }
    }
}
extension UILabel
{
    public var theme_textColor: SPThemeColorPicker? {
        get { return getThemePicker(self, "setTextColor:") as? SPThemeColorPicker }
        set { setThemePicker(self, "setTextColor:", newValue) }
    }
    public var theme_highlightedTextColor: SPThemeColorPicker? {
        get { return getThemePicker(self, "setHighlightedTextColor:") as? SPThemeColorPicker }
        set { setThemePicker(self, "setHighlightedTextColor:", newValue) }
    }
    public var theme_shadowColor: SPThemeColorPicker? {
        get { return getThemePicker(self, "setShadowColor:") as? SPThemeColorPicker }
        set { setThemePicker(self, "setShadowColor:", newValue) }
    }
}
extension UINavigationBar
{
    public var theme_barStyle: SPThemeBarStylePicker? {
        get { return getThemePicker(self, "setBarStyle:") as? SPThemeBarStylePicker }
        set { setThemePicker(self, "setBarStyle:", newValue) }
    }
    public var theme_barTintColor: SPThemeColorPicker? {
        get { return getThemePicker(self, "setBarTintColor:") as? SPThemeColorPicker }
        set { setThemePicker(self, "setBarTintColor:", newValue) }
    }
}

extension UITabBar
{
    public var theme_barStyle: SPThemeBarStylePicker? {
        get { return getThemePicker(self, "setBarStyle:") as? SPThemeBarStylePicker }
        set { setThemePicker(self, "setBarStyle:", newValue) }
    }
    public var theme_barTintColor: SPThemeColorPicker? {
        get { return getThemePicker(self, "setBarTintColor:") as? SPThemeColorPicker }
        set { setThemePicker(self, "setBarTintColor:", newValue) }
    }
}
extension UITableView
{
    public var theme_separatorColor: SPThemeColorPicker? {
        get { return getThemePicker(self, "setSeparatorColor:") as? SPThemeColorPicker }
        set { setThemePicker(self, "setSeparatorColor:", newValue) }
    }
}
extension UITextField
{
   
    public var theme_keyboardAppearance: SPThemeKeyboardAppearancePicker? {
        get { return getThemePicker(self, "setKeyboardAppearance:") as? SPThemeKeyboardAppearancePicker }
        set { setThemePicker(self, "setKeyboardAppearance:", newValue) }
    }
    public var theme_textColor: SPThemeColorPicker? {
        get { return getThemePicker(self, "setTextColor:") as? SPThemeColorPicker }
        set { setThemePicker(self, "setTextColor:", newValue) }
    }
}
extension UITextView
{

    public var theme_keyboardAppearance: SPThemeKeyboardAppearancePicker? {
        get { return getThemePicker(self, "setKeyboardAppearance:") as? SPThemeKeyboardAppearancePicker }
        set { setThemePicker(self, "setKeyboardAppearance:", newValue) }
    }
    public var theme_textColor: SPThemeColorPicker? {
        get { return getThemePicker(self, "setTextColor:") as? SPThemeColorPicker }
        set { setThemePicker(self, "setTextColor:", newValue) }
    }
}

extension CALayer
{
    public var theme_backgroundColor: SPThemeCGColorPicker? {
        get { return getThemePicker(self, "setBackgroundColor:") as? SPThemeCGColorPicker}
        set { setThemePicker(self, "setBackgroundColor:", newValue) }
    }
    public var theme_borderWidth: SPThemeCGColorPicker? {
        get { return getThemePicker(self, "setBorderWidth:") as? SPThemeCGColorPicker }
        set { setThemePicker(self, "setBorderWidth:", newValue) }
    }
    public var theme_borderColor: SPThemeCGColorPicker? {
        get { return getThemePicker(self, "setBorderColor:") as? SPThemeCGColorPicker }
        set { setThemePicker(self, "setBorderColor:", newValue) }
    }
    public var theme_shadowColor: SPThemeCGColorPicker? {
        get { return getThemePicker(self, "setShadowColor:") as? SPThemeCGColorPicker }
        set { setThemePicker(self, "setShadowColor:", newValue) }
    }
}


private func getThemePicker( _ object : NSObject, _ selector : String) -> SPThemePicker? {
    return object.themePickers[selector]
}

private func setThemePicker(_ object : NSObject, _ selector : String , _ picker : SPThemePicker?) {
    object.themePickers[selector] = picker
    object.performThemePicker(selector: selector, picker: picker)
}

private func makeStatePicker(_ object : NSObject, _ selector : String, _ picker : SPThemePicker?, _ state: UIControlState) -> SPThemePicker? {
    var picker = picker
    
    if let statePicker = object.themePickers[selector] as? SPThemeStatePicker  {
        picker = statePicker.setPicker(picker, forState: state)
    } else {
        picker = SPThemeStatePicker(picker: picker, withState: state)
    }
    return picker
    
}
