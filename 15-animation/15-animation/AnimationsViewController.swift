//
//  AnimationsViewController.swift
//  15-animation
//
//  Created by takazawa on 2017/08/16.
//  Copyright © 2017年 ryosuke takazawa. All rights reserved.
//

import UIKit

class AnimationsViewController: UIViewController {
    
    @IBAction func tapView(_ sender: UITapGestureRecognizer) {
        // flowerを作る
        let flower = UIImageView(image: UIImage(named: "flower"))
        flower.alpha = 0
        
        // 2倍サイズにする
        let scaleTransform = CGAffineTransform(scaleX: 2, y: 2)
        // -π/2回転する
        let rotationTransform = CGAffineTransform(rotationAngle: CGFloat(Double.pi/2))
        // トランスフォームを足し合わせる
        let transform = scaleTransform.concatenating(rotationTransform)
        // flowerを変形させる
        flower.transform = transform
        
        flower.center = sender.location(in: self.view)
        view.addSubview(flower)
        
        UIView.animate(
            withDuration: 2.0,
            delay: 0,
            options: [.curveEaseInOut],
            animations: {
                flower.alpha = 1.0
        },
            completion: {(finished:Bool) in
                self.fadeoutAndRemove(flower)
        })
    }
    
    func fadeoutAndRemove(_ view: UIView) {
        UIView.animate(
            withDuration: 2.0,
            delay: 3.0,
            options: UIViewAnimationOptions(),
            animations: {
                view.alpha = 0.0
        }, completion: {(finished: Bool) in
            view.removeFromSuperview()
        })
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
