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
    
    @IBOutlet weak var mySlider1: UISlider!
    @IBOutlet weak var sliderLabel: UILabel!
    @IBOutlet weak var myProgress: UIProgressView!
    @IBOutlet weak var progressLabel: UILabel!
    
    @IBAction func tapSave(_ sender: UIButton) {
        let defaults = UserDefaults.standard
        defaults.set(mySwitch1.isOn, forKey: "switchOn")
    }
    
    @IBAction func tapRead(_ sender: UIButton) {
        let defaults = UserDefaults.standard
        mySwitch2.isOn = defaults.bool(forKey: "switchOn")
    }
    
    @IBAction func tapSliderSave(_ sender: UIButton) {
        let defaults = UserDefaults.standard
        let value = mySlider1.value
        
        defaults.set(value, forKey: "sliderValue")
    }
    
    @IBAction func tapSliderRead(_ sender: UIButton) {
        let defaults = UserDefaults.standard
        let value = defaults.float(forKey: "sliderValue")
        
        progressLabel.text = String(value)
        myProgress.progress = value
    }
    
    @IBAction func slide(_ sender: UISlider) {
        sliderLabel.text = String(sender.value)
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

