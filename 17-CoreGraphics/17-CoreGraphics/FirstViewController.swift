//
//  FirstViewController.swift
//  17-CoreGraphics
//
//  Created by takazawa on 2017/08/17.
//  Copyright © 2017年 ryosuke takazawa. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController {
    
    func makeBoxImage(width w: CGFloat, height h: CGFloat) -> UIImage {
        
        let size = CGSize(width: w, height: h)
        // 開始
        UIGraphicsBeginImageContextWithOptions(size, false, 1.0)
        
        let context = UIGraphicsGetCurrentContext()
        
        let drawRect = CGRect(x: 0, y: 0, width: w, height: h)
        let drawPath = UIBezierPath(rect: drawRect)
        
        context?.setFillColor(red: 0.0, green: 1.0, blue: 1.0, alpha: 1.0)
        drawPath.fill()
        context?.setStrokeColor(red: 0.0, green: 0.0, blue: 1.0, alpha: 1.0)
        drawPath.stroke()
        
        let image = UIGraphicsGetImageFromCurrentImageContext()
        // 終了
        UIGraphicsEndImageContext()
        return image!
    }
    
    func makeRoundRectImage(width w: CGFloat, height h: CGFloat, corner r: CGFloat) -> UIImage {
        let size = CGSize(width: w, height: h)
        // 開始
        UIGraphicsBeginImageContextWithOptions(size, false, 1.0)
        
        let context = UIGraphicsGetCurrentContext()
        
        let drawRect = CGRect(x: 0, y: 0, width: w, height: h)
        let drawPath = UIBezierPath(roundedRect: drawRect, cornerRadius: r)
        
        context?.setFillColor(red: 0.8, green: 0.8, blue: 0.8, alpha: 1.0)
        drawPath.fill()
        
        let image = UIGraphicsGetImageFromCurrentImageContext()
        // 終了
        UIGraphicsEndImageContext()
        return image!
    }
    
    func drawLine() -> UIImage {
        let size = view.bounds.size
        // 開始
        UIGraphicsBeginImageContextWithOptions(size, false, 1.0)
        
        let arcPath = UIBezierPath(
            arcCenter: CGPoint(x: view.center.x, y: 100),  // 中心
            radius: 80.0,  // 半径
            startAngle: 0.0,  // 開始角度（0が3時)
            endAngle: CGFloat(Double.pi*5/3),  // 終了角度(π*5/3 = 300度)
            clockwise: true // 時計回り
        )
        arcPath.lineWidth = 40
        arcPath.lineCapStyle = .round // .butt .round .square
        arcPath.stroke()
        
        let image = UIGraphicsGetImageFromCurrentImageContext()
        // 終了
        UIGraphicsEndImageContext()
        return image!
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let boxImage = makeBoxImage(width: 240, height: 180)
        let boxView = UIImageView(image: boxImage)
        boxView.center = view.center
        view.addSubview(boxView)
        
        let roundImage = makeRoundRectImage(width: 240, height: 180, corner: 20)
        let roundView = UIImageView(image: roundImage)
        roundView.center = view.center
        view.addSubview(roundView)
        
        let lineImage = drawLine()
        let lineView = UIImageView(image: lineImage)
        view.addSubview(lineView)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

