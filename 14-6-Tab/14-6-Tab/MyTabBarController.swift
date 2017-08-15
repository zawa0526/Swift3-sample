//
//  MyTabBarController.swift
//  14-6-Tab
//
//  Created by takazawa on 2017/08/15.
//  Copyright © 2017年 ryosuke takazawa. All rights reserved.
//

import UIKit

class MyTabBarController: UITabBarController {

    override func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
        if item.title == "Third" {
            item.badgeValue = nil
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let tabBarItem = tabBar.items?[2]
        tabBarItem?.badgeValue = "New"
        // Do any additional setup after loading the view.
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
