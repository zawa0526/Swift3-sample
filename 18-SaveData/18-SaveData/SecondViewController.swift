//
//  SecondViewController.swift
//  18-SaveData
//
//  Created by takazawa on 2017/08/17.
//  Copyright © 2017年 ryosuke takazawa. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {


    @IBOutlet weak var textView1: UITextView!
    @IBOutlet weak var textView2: UITextView!
    
    let filePAth = NSHomeDirectory() + "/Documents/myTextfile.txt"
    
    // ファイルに保存
    @IBAction func saveToFile(_ sender: UIButton) {
        view.endEditing(true)
        
        let textData = textView1.text
        
        do {
            try textData?.write(toFile: filePAth, atomically: true, encoding: String.Encoding.utf8)
        } catch let err as NSError {
            print("保存に失敗: ", err)
        }
    }
    
    @IBAction func readFromFile(_ sender: UIButton) {
    
        do {
            let textData = try String(contentsOfFile: filePAth, encoding: String.Encoding.utf8)
            textView2.text = textData
        } catch let err as NSError {
            textView2.text = "読み込みに失敗。 \n \(err)"
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        textView2.layer.borderColor = UIColor.red.cgColor
        textView2.layer.borderWidth = 2.0
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

