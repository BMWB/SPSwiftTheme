//
//  ViewController.swift
//  Theme
//
//  Created by wtj on 2017/8/15.
//  Copyright © 2017年 wtj. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.view.theme_backgroundColor = SPThemeColorPicker.pickerWithColors(["#ECF0F1", "#56ABE4", "#ffffff", "#292b38"])
        let button = UIButton(frame: CGRect(x: 50, y: 100, width: 50, height: 30))
        
        button.setTitle("点我", for: UIControlState.normal)
        button.setTitleColor(UIColor.orange, for: UIControlState.normal)
        button.theme_backgroundColor = SPThemeColorPicker.pickerWithColors(["#EB4F38", "#F4C600", "#56ABE4", "#ECF0F1"]);
        button.addTarget(self, action: #selector(self.buttonAction(sender:)), for: UIControlEvents.touchUpInside)
        self.view.addSubview(button)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func buttonAction(sender: UIButton) -> Void {
        var next = SPThemeManager.currentThemeIndex + 1;
        if (next > 2) { // cycle and without Night
            next = 0;
        }

        SPThemeManager.setTheme(index: next)
    }

}

