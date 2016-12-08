//
//  MainViewController.swift
//  TumblrMenu
//
//  Created by ChenZuo on 2016/12/6.
//  Copyright © 2016年 ChenZuo. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.isNavigationBarHidden = true
    }
    
    override var preferredStatusBarStyle : UIStatusBarStyle {
        return UIStatusBarStyle.lightContent
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
    @IBAction func unwindToMainViewController (_ sender: UIStoryboardSegue){
        self.dismiss(animated: true, completion: nil)
    }
    
    

}
