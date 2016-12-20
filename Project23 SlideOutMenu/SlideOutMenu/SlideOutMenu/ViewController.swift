//
//  ViewController.swift
//  SlideOutMenu
//
//  Created by ChenZuo on 2016/12/16.
//  Copyright © 2016年 ChenZuo. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var openButton: UIBarButtonItem!
    @IBOutlet weak var aLabel: UILabel!
    
    
    var varView = Int()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        openButton.target = self.revealViewController()
        openButton.action = #selector(SWRevealViewController.revealToggle(_:))
        
        self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
        
        if (varView == 0) {
            aLabel.text = "😂"
        } else {
            aLabel.text = "👻"
        }
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

