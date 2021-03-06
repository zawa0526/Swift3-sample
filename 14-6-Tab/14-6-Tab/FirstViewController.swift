//
//  FirstViewController.swift
//  14-6-Tab
//
//  Created by takazawa on 2017/08/15.
//  Copyright © 2017年 ryosuke takazawa. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController {
    
    @IBAction func showAlert(_ sender: Any) {
        let alert = UIAlertController(title: nil, message: nil, preferredStyle: .alert)
        alert.title = "タイトル"
        alert.message = "メッセージ文"
        
        // ボタン
        alert.addAction(
            UIAlertAction(
                title: "ボタン1です",
                style: .default,
                handler: {
                    self.hello($0.title!)
            })
        )
        alert.addAction(
            UIAlertAction(
                title: "ボタン2です",
                style: .default,
                handler: {(action) -> Void in
                    self.hello(action.title!)
            })
        )
        alert.addAction(
            UIAlertAction(
                title: "キャンセル",
                style: .cancel,
                handler: nil)
        )
        alert.addAction(
            UIAlertAction(
                title: "削除します",
                style: .destructive,
                handler: {(action) -> Void in
                    self.hello(action.title!)
            })
        )
        
        // アラートを表示する
        self.present(alert, animated: true, completion: {
            print("アラート表示完了")
        })
    }
    
    func hello(_ msg: String) {
        print(msg)
    }
    
    @IBAction func showActionSheet(_ sender: Any) {
        // アクションシートのインスタンスをつくる
        let actionSheet = UIAlertController(
            title: "タイトル",
            message: "メッセージ文",
            preferredStyle: .actionSheet)
        
        actionSheet.addAction(
            UIAlertAction(title: "ボタン1だよ",
                          style: .default,
                          handler: {
                            (action) -> Void in
                            self.hello(action.title!)
            })
        )
        actionSheet.addAction(
            UIAlertAction(title: "ボタン2だよ",
                          style: .default,
                          handler: {
                            (action) -> Void in
                            self.hello(action.title!)
            })
        )
        // キャンセル
        actionSheet.addAction(
            UIAlertAction(title: "キャンセル",
                          style: .cancel,
                          handler: {
                            (action) -> Void in
                            self.hello(action.title!)
            })
        )
        // 赤色のボタン
        actionSheet.addAction(
            UIAlertAction(title: "削除します",
                          style: .destructive,
                          handler: {
                            (action) -> Void in
                            self.hello(action.title!)
            })
        )
        
        self.present(
            actionSheet,
            animated: true,
            completion: {
                print("アクションシート表示")
        })
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

