//
//  JogBoyViewController.swift
//  15-animation
//
//  Created by takazawa on 2017/08/16.
//  Copyright © 2017年 ryosuke takazawa. All rights reserved.
//

import UIKit

class JogBoyViewController: UIViewController {
    
    @IBOutlet weak var boyView: UIImageView!
    
    @IBAction func runSpeed(_ sender: UISlider) {
        print(sender.value)
        // 再生秒数をスライダで決める
        let sec = (1 - sender.value) * 3
        // 再生にかかる秒数を設定
        boyView.animationDuration = TimeInterval(sec)
        
        if sender.value == 0 {
            boyView.stopAnimating()
            boyView.image = UIImage(named: "jogboy_0")
        } else {
            if !boyView.isAnimating {
                boyView.animationImages = jogboyImages()
                boyView.animationRepeatCount = 0
                boyView.startAnimating()
            }
        }
    }
    
    func jogboyImages() -> Array<UIImage> {
        var theArray = Array<UIImage>()
        for num in 1...10 {
            let imageName = "jogboy_" + String(num)
            let image = UIImage(named: imageName)
            theArray.append(image!)
        }
        return theArray
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
