//
//  ViewController.swift
//  part-3
//
//  Created by takazawa on 2017/08/13.
//  Copyright © 2017年 ryosuke takazawa. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    
    
    @IBOutlet weak var myScrollView: UIScrollView!
    @IBOutlet weak var contentView: UIView!
    @IBOutlet var myTextFields: [UITextField]!
    
    var editingField: UITextField?  // 編集中のテキストフィールド
    var overlap: CGFloat = 0.0      // 重なっている高さ
    var lastOffsetY: CGFloat = 0.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // テスト
        // スクロールフィールドの領域を指定
        let scrollFrame = CGRect(x: 0, y: 20, width: view.frame.width, height: view.frame.height-20)
        myScrollView.frame = scrollFrame
        // コンテンツサイズを指定
        let contentRect = contentView.bounds
        myScrollView.contentSize = CGSize(width: contentRect.width, height: contentRect.height)

        // 全てのテキストフィールドのデリゲートになる
        for fld in myTextFields {
            fld.delegate = self
        }
        
        // 通知センターを得る
        let notification = NotificationCenter.default
        notification.addObserver(self, selector: #selector(ViewController.keyboardChangeFrame(_:)),
                                 name: NSNotification.Name.UIKeyboardDidChangeFrame, object: nil)
        notification.addObserver(self, selector: #selector(ViewController.keyboardWillShow(_:)),
                                 name: NSNotification.Name.UIKeyboardWillShow, object: nil)
        notification.addObserver(self, selector: #selector(ViewController.keyboardDidHide(_:)),
                                 name: NSNotification.Name.UIKeyboardDidHide, object: nil)

     }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        editingField = textField
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        editingField = nil
    }
    
    func keyboardChangeFrame(_ notification: Notification) {
        guard let fld = editingField else {
            return
        }
        
        let userInfo = (notification as NSNotification).userInfo!
        let keybordFrame = (userInfo[UIKeyboardFrameEndUserInfoKey] as! NSValue).cgRectValue
        let fldFrame = view.convert(fld.frame, from: contentView)
        overlap = fldFrame.maxY - keybordFrame.minY + 5
        
        if overlap > 0 {
            overlap += myScrollView.contentOffset.y
            // 上方向にスクロール
            myScrollView.setContentOffset(CGPoint(x: 0, y: overlap), animated: true)
        }
    }
    
    // 最初の位置を覚えておく
    func keyboardWillShow(_ notification: Notification) {
        lastOffsetY = myScrollView.contentOffset.y
    }
    
    func keyboardDidHide(_ notification: Notification) {
        // スクロールを元に戻す
        let baseline = (contentView.bounds.height - myScrollView.bounds.height)
        lastOffsetY = min(baseline, lastOffsetY)
        myScrollView.setContentOffset(CGPoint(x: 0, y: lastOffsetY), animated: true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        view.endEditing(true)
        return false
    }
    
    @IBAction func tapView(_ sender: Any) {
        view.endEditing(true)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

