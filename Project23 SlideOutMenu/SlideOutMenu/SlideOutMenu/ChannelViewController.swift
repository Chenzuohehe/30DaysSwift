//
//  ChannelViewController.swift
//  SlideOutMenu
//
//  Created by ChenZuo on 2016/12/19.
//  Copyright © 2016年 ChenZuo. All rights reserved.
//

import UIKit
import Foundation

class ChannelViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        UIApplication.shared.isStatusBarHidden = true
        self.navigationController?.isNavigationBarHidden = true
        
        self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

}
