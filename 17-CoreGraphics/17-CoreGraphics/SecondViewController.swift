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
    
    func drawCurveLines() -> UIImage {
        
        // コントロールポイント1点 -> U字
        let a = CGPoint(x: 50, y: 70)
        let b = CGPoint(x: 250, y: 100)
        let c = CGPoint(x: 120, y: 200)

        // コントロールポイント2点 -> S字
        let d = CGPoint(x: 50, y: 300)
        let e = CGPoint(x: 250, y: 300)
        let f = CGPoint(x: 250, y: 500)
        let g = CGPoint(x: 100, y: 550)
        
        let size = view.frame.size
        UIGraphicsBeginImageContextWithOptions(size, false, 1.0)
        
        // 補助線
        UIColor.black.setStroke()
        let linePath = UIBezierPath()
        linePath.append(makeLinePath(a, b))
        linePath.append(makeLinePath(b, c))
        linePath.append(makeLinePath(d, e))
        linePath.append(makeLinePath(f, g))
        linePath.setLineDash([2.0, 2.0], count: 2, phase: 0.0)
        linePath.stroke()
        
        UIColor.red.setStroke()
        let curvePath1 = UIBezierPath()
        curvePath1.move(to: a)
        curvePath1.addQuadCurve(to: c, controlPoint: b)
        curvePath1.lineWidth = 2.0
        curvePath1.stroke()
        
        UIColor.green.setStroke()
        let curvePath2 = UIBezierPath()
        curvePath2.move(to: d)
        curvePath2.addCurve(to: f, controlPoint1: e, controlPoint2: g)
        curvePath2.lineWidth = 2.0
        curvePath2.stroke()
        
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        return image!
    }
    
    func makeLinePath(_ startPoint: CGPoint, _ endPoint: CGPoint) -> UIBezierPath {
        let path = UIBezierPath()
        path.move(to: startPoint)
        path.addLine(to: endPoint)
        return path
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let drawImage = drawLine()
        let drawView = UIImageView(image: drawImage)
        view.addSubview(drawView)
        
        let curveImage = drawCurveLines()
        let curveView = UIImageView(image: curveImage)
        view.addSubview(curveView)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

