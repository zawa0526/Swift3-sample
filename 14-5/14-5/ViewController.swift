//
//  ViewController.swift
//  14-5
//
//  Created by takazawa on 2017/08/15.
//  Copyright © 2017年 ryosuke takazawa. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var webView: UIWebView!
    
    var data: (name: String, url: String)?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        openWeb()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    func openWeb() {
        if let webData = data {
            if let url = NSURL(string: webData.url) {
                let urlReq = NSURLRequest(url: url as URL)
                webView.loadRequest(urlReq as URLRequest)
            }
        }
    }

}

