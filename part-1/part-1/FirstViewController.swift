//
//  FirstViewController.swift
//  part-1
//
//  Created by takazawa on 2017/08/11.
//  Copyright © 2017年 ryosuke takazawa. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController {

    @IBAction func tapGreen(_ sender: Any) {
        view.backgroundColor = UIColor.green
    }
    @IBAction func tapWhite(_ sender: Any) {
        view.backgroundColor = UIColor.white
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

