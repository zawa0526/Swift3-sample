//
//  AzarashiViewController.swift
//  15-animation
//
//  Created by takazawa on 2017/08/16.
//  Copyright © 2017年 ryosuke takazawa. All rights reserved.
//

import UIKit

class AzarashiViewController: UIViewController {

    @IBOutlet weak var azarashi: UIImageView!
    
    @IBAction func tapView(_ sender: UITapGestureRecognizer) {
        
        // タップした座標取得
        let tapPoint = sender.location(in: view)
        UIView.animate(
            withDuration: 1.0,
            delay: 0,
            options: [.curveEaseInOut, // イーズイン・アウト（スーッ）
                      .autoreverse,    // 逆再生(一回戻る）
                      .repeat],        // 繰り返し
            animations: {
                self.azarashi.center = tapPoint
        },
            completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
