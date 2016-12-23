//
//  SecondTableViewController.swift
//  Tabbar
//
//  Created by ChenZuo on 2016/12/23.
//  Copyright © 2016年 ChenZuo. All rights reserved.
//

import UIKit

class SecondTableViewController: UIViewController {

    @IBOutlet weak var explorImageView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.explorImageView.alpha = 0
        self.explorImageView.transform = CGAffineTransform(scaleX: 0.5, y: 0.5)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        UIView.animate(withDuration: 0.5, delay: 0.1, usingSpringWithDamping: 0.7, initialSpringVelocity: 1, options: .curveEaseIn, animations: {
            self.explorImageView.transform = CGAffineTransform(scaleX: 1, y: 1)
            self.explorImageView.alpha = 1
        }, completion: nil)
    }

    override func viewWillAppear(_ animated: Bool) {
        self.explorImageView.alpha = 0
        self.explorImageView.transform = CGAffineTransform(scaleX: 0.5, y: 0.5)
    }

}
