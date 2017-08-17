//
//  ThirdViewController.swift
//  17-CoreGraphics
//
//  Created by takazawa on 2017/08/17.
//  Copyright © 2017年 ryosuke takazawa. All rights reserved.
//

import UIKit

class ThirdViewController: UIViewController {
    
    func drawPathImage() -> UIImage {
        let size = view.bounds.size
        UIGraphicsBeginImageContextWithOptions(size, false, 1.0)
        UIColor.lightGray.setFill()
        
        let boxRect = CGRect(x: 100, y: 100, width: 150, height: 100)
        let boxPath = UIBezierPath(rect: boxRect)
        boxPath.lineWidth = 2.0
        boxPath.fill()
        boxPath.stroke()
        
        let curvePath = UIBezierPath()
        let pt0 = CGPoint(x: 80, y: 300)
        let pt1 = CGPoint(x: 300, y: 500)
        let cPt0 = CGPoint(x: 400, y: 300)
        let cPt1 = CGPoint(x: 100, y: 600)
        curvePath.move(to: pt0)
        curvePath.addCurve(to: pt1, controlPoint1: cPt0, controlPoint2: cPt1)
        curvePath.lineWidth = 2.0
        curvePath.fill()
        curvePath.stroke()
        
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        return image!
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let drawImage = drawPathImage()
        let drawView = UIImageView(image: drawImage)
        view.addSubview(drawView)
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
