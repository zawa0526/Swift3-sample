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
        
        let center = CGPoint(x: view.center.x, y: 100)
        
        let arcPath = UIBezierPath(
            arcCenter: center,  // 中心
            radius: 80.0,  // 半径
            startAngle: CGFloat(-Double.pi/2),  // 開始角度（0が3時)
            endAngle: CGFloat(Double.pi*3/4),  // 終了角度(π*5/3 = 300度)
            clockwise: true // 時計回り
        )
        
        // 中心までパス追加
        arcPath.addLine(to: center)
        // 閉じる（開始点につなぐ）
        arcPath.close()

        UIColor.cyan.setFill()
        arcPath.fill()
        arcPath.lineWidth = 5
        arcPath.lineCapStyle = .butt // .butt .round .square
        arcPath.stroke()
        
        let image = UIGraphicsGetImageFromCurrentImageContext()
        // 終了
        UIGraphicsEndImageContext()
        return image!
    }
    
    func arcPercent(_ radius: CGFloat, _ percent: Double) -> UIBezierPath {
        let endAngle = 2*Double.pi*percent/100 - Double.pi/2
        let path = UIBezierPath(
            arcCenter: CGPoint(x: 0, y: 0),  // 中心
            radius: radius,  // 半径
            startAngle: CGFloat(-Double.pi/2),  // 開始角度（0が3時)
            endAngle: CGFloat(endAngle),  // 終了角度(π*5/3 = 300度)
            clockwise: percent>0 // 時計回り
        )
        
        return path
    }
    
    func drawArcPercent() -> UIImage {
        let size = view.bounds.size
        // 開始
        UIGraphicsBeginImageContextWithOptions(size, false, 1.0)
        
        let percent = 58.2
        
        UIColor.red.setStroke()
        let arcPath = arcPercent(80, percent)
        arcPath.lineWidth = 60
        arcPath.lineCapStyle = .butt
        
        // パスを平行移動する
        let tf = CGAffineTransform(translationX: view.center.x, y: view.center.y + 200)
        arcPath.apply(tf)
        arcPath.stroke()
        
        // 「何％」の数字を描く
        let font = UIFont.boldSystemFont(ofSize: 28)
        let textFontAttributes = [NSFontAttributeName: font,
                                  NSForegroundColorAttributeName: UIColor.gray]
        let drawString = String(percent) + "%"
        let rect = CGRect(x: view.center.x - 45, y: view.center.y + 185, width: 90, height: 30)
        drawString.draw(in: rect, withAttributes: textFontAttributes)
        
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
        
        let arcImage = drawArcPercent()
        let arcView = UIImageView(image: arcImage)
        view.addSubview(arcView)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

