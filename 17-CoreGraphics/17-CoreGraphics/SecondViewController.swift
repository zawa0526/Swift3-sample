//
//  SecondViewController.swift
//  17-CoreGraphics
//
//  Created by takazawa on 2017/08/17.
//  Copyright © 2017年 ryosuke takazawa. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {
    
    func drawLine() -> UIImage {
        var pointList = Array<CGPoint>()
        let pointCount = 20
        
        let dx = Int(view.frame.width)/pointCount
        let height = UInt32(view.frame.height)/2
        for n in 1...pointCount {
            let px = CGFloat(dx * n)
            let py = CGFloat(arc4random_uniform(height) + 50)
            let point = CGPoint(x: px, y: py)
            pointList.append(point)
        }
        
        let size = view.bounds.size
        UIGraphicsBeginImageContextWithOptions(size, false, 1.0)
        
        let drawPath = UIBezierPath()
        drawPath.move(to: pointList[0])
        /// 以降はaddLineなので始点は削除
        pointList.removeFirst()
        
        for pt in pointList {
            drawPath.addLine(to: pt)
        }
        
        // 線の属性
        UIColor.blue.setStroke()
        drawPath.lineWidth = 2.0
        //  つなぎ目 .miter .round .bevel(http://cocoaapi.hatenablog.com/entry/00000108/recID34857)
        drawPath.lineJoinStyle = .round
        // 点線にする
        drawPath.setLineDash([4.0, 2.0], count: 2, phase: 0.0)
        drawPath.stroke()
        
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        return image!
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let drawImage = drawLine()
        let drawView = UIImageView(image: drawImage)
        view.addSubview(drawView)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

