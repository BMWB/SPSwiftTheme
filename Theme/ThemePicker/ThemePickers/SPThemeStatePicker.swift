//
//  SPThemeStatePicker.swift
//  Theme
//
//  Created by wtj on 2017/8/16.
//  Copyright © 2017年 wtj. All rights reserved.
//

import UIKit

final class SPThemeStatePicker: SPThemePicker {

    typealias valuesType = [UInt: SPThemePicker]
    
    var values = valuesType()
    
    convenience init?(picker: SPThemePicker?, withState state: UIControlState) {
    
        guard let picker = picker else { return nil }
        
        self.init(v: {0})
        values[state.rawValue] = picker
    }
    
    func setPicker(_ picker: SPThemePicker?, forState state:UIControlState) -> Self {
        values[state.rawValue] = picker
        return self
    }
}
