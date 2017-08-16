//
//  FirstViewController.swift
//  16-GestureRecognizer
//
//  Created by takazawa on 2017/08/16.
//  Copyright © 2017年 ryosuke takazawa. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController {

    @IBAction func tapTombo(_ sender: UITapGestureRecognizer) {
        let tombo = sender.view!
        
        let newX = arc4random_uniform(UInt32(view.frame.width))
        let newY = arc4random_uniform(UInt32(view.frame.height))
        tombo.center = CGPoint(x: Double(newX), y: Double(newY))
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(self.hello(_:)))
        // View作成
        let myView = UIView(frame: CGRect(x: 100, y: 100, width: 80, height: 80))
        myView.backgroundColor = UIColor.green
        myView.tag = 1
        // Viewにタップジェスチャーレコグナイザを設定
        myView.addGestureRecognizer(tapGesture)
        view.addSubview(myView)
    }
    
    func hello(_ sender: UITapGestureRecognizer) {
        let tagNo = sender.view?.tag
        print("ハロー", tagNo!)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

