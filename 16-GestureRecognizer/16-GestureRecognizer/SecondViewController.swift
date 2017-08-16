//
//  SecondViewController.swift
//  16-GestureRecognizer
//
//  Created by takazawa on 2017/08/16.
//  Copyright © 2017年 ryosuke takazawa. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(hue: kakudo/360, saturation: 1.0, brightness: 1.0, alpha: 1.0)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func dragging(_ sender: UIPanGestureRecognizer) {
        let tombo = sender.view!
        tombo.center = sender.location(in: view)
    }

    // 0〜360 色相
    var kakudo: CGFloat = 180.0
    @IBAction func draggingOnView(_ sender: UIPanGestureRecognizer) {
        let translation = sender.translation(in: view)
        
        // 水平方向の移動量
        if translation.x > 0 {
            kakudo -= 1.0
        } else {
            kakudo += 1.0
        }
        
        // 0〜360の間で回す
        if kakudo<0 {
            kakudo += 360
        } else if kakudo > 360{
            kakudo -= 360
        }
                
        let color = UIColor(hue: kakudo/360, saturation: 1.0, brightness: 1.0, alpha: 1.0)
        view.backgroundColor = color
    }
}

