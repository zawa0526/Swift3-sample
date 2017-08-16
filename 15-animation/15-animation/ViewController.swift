//
//  ViewController.swift
//  15-animation
//
//  Created by takazawa on 2017/08/16.
//  Copyright © 2017年 ryosuke takazawa. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var car: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // タイマーを作成
        Timer.scheduledTimer(
            timeInterval: 0.1,
            target: self,
            selector: #selector(self.step),
            userInfo: nil,
            repeats: true)
        
    }
    
    func step() {
        car.center.x += 10
        let carWitdth = car.bounds.width
        if car.center.x > (view.bounds.width + carWitdth/2) {
            car.center.x = -carWitdth
            let viewH = view.bounds.height
            car.center.y = CGFloat(arc4random_uniform(UInt32(viewH)))
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

