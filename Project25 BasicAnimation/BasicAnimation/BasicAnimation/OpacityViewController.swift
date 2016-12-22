//
//  OpacityViewController.swift
//  BasicAnimation
//
//  Created by ChenZuo on 2016/12/21.
//  Copyright © 2016年 ChenZuo. All rights reserved.
//

import UIKit

class OpacityViewController: UIViewController {

    @IBOutlet weak var exampleImageView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        UIView.animate(withDuration: 2, animations: {
            
            self.exampleImageView.alpha = 0
        })
    }

}
