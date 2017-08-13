//
//  ViewController.swift
//  part-2
//
//  Created by takazawa on 2017/08/12.
//  Copyright © 2017年 ryosuke takazawa. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        print("ありがとう", "こんにちわ", " byebye", separator: "/")
        print(#file, #line, #column, "function", separator: ":", terminator: "終点")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

