//
//  ViewController.swift
//  chapter-14
//
//  Created by takazawa on 2017/08/14.
//  Copyright © 2017年 ryosuke takazawa. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBAction func comeHome(segue: UIStoryboardSegue) {
        
    }
    
    @IBAction func goToTreePage(_ sender: Any) {
        let nextVC = self.storyboard?.instantiateViewController(withIdentifier: "treePage")
        nextVC?.modalTransitionStyle = .flipHorizontal
        present(nextVC!, animated: true, completion: nil)
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

