//
//  FirstViewController.swift
//  18-SaveData
//
//  Created by takazawa on 2017/08/17.
//  Copyright © 2017年 ryosuke takazawa. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController {

    
    @IBOutlet weak var mySwitch1: UISwitch!
    @IBOutlet weak var mySwitch2: UISwitch!
    
    
    @IBAction func tapSave(_ sender: UIButton) {
        let defaults = UserDefaults.standard
        defaults.set(mySwitch1.isOn, forKey: "switchOn")
    }
    
    @IBAction func tapRead(_ sender: UIButton) {
        let defaults = UserDefaults.standard
        mySwitch2.isOn = defaults.bool(forKey: "switchOn")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

