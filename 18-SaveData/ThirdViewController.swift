//
//  ThirdViewController.swift
//  18-SaveData
//
//  Created by takazawa on 2017/08/18.
//  Copyright © 2017年 ryosuke takazawa. All rights reserved.
//

import UIKit

class ThirdViewController: UIViewController {

    
    @IBOutlet weak var myTextView: UITextView!
    let filePAth = NSHomeDirectory() + "/Documents/myTextfile.txt"
    var originalFrame: CGRect?
    
    @IBAction func cancel(_ sender: Any) {
        view.endEditing(true)
        readFromFile()
    }
    
    @IBAction func saveToFile(_ sender: UIBarButtonItem) {
        view.endEditing(true)
        
        let textData = myTextView.text
        
        do {
            try textData?.write(toFile: filePAth, atomically: true, encoding: String.Encoding.utf8)
        } catch let err as NSError {
            print("保存に失敗: ", err)
        }
    }
    
    func readFromFile() {
        
        do {
            let textData = try String(contentsOfFile: filePAth, encoding: String.Encoding.utf8)
            myTextView.text = textData
        } catch let err as NSError {
            myTextView.text = "読み込みに失敗。 \n \(err)"
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        originalFrame = myTextView.frame
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        readFromFile()
        
        // 通知センターのオブジェクト
        let notification = NotificationCenter.default
        
        // キーボードが登場
        notification.addObserver(self,
                                 selector: #selector(self.keyboardDidShow(_:)),
                                 name: NSNotification.Name.UIKeyboardDidShow,
                                 object: nil)
        
        // キーボードのフレームが変更された
        notification.addObserver(self,
                                 selector: #selector(self.keyboardChangeFrame(_:)),
                                 name: NSNotification.Name.UIKeyboardDidChangeFrame,
                                 object: nil)

        // キーボードが退場
        notification.addObserver(self,
                                 selector: #selector(self.keyboardDidHide(_:)),
                                 name: NSNotification.Name.UIKeyboardDidHide,
                                 object: nil)
        
        
    }
    
    func keyboardDidShow(_ notification: Notification) {
        
    }
    
    func keyboardChangeFrame(_ notification: Notification) {
        print("change!!!!!!!")
        let userInfo = (notification as NSNotification).userInfo!
        let keyboardFrame = (userInfo[UIKeyboardFrameEndUserInfoKey] as! NSValue).cgRectValue
        var textViewFrame = myTextView.frame
        textViewFrame.size.height = keyboardFrame.minY - textViewFrame.minY - 5
        myTextView.frame = textViewFrame
    }
    
    func keyboardDidHide(_ notification: Notification) {
        myTextView.frame = originalFrame!
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
