//
//  ScaleViewController.swift
//  BasicAnimation
//
//  Created by ChenZuo on 2016/12/21.
//  Copyright © 2016年 ChenZuo. All rights reserved.
//

import UIKit

class ScaleViewController: UIViewController {

    @IBOutlet weak var scaleImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.scaleImageView.alpha = 0
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        
        UIView.animate(withDuration: 0.8, delay: 0, usingSpringWithDamping: 0.7, initialSpringVelocity: 1, options: .curveEaseIn, animations: { () -> Void in
            
            self.scaleImageView.transform = CGAffineTransform(scaleX: 2, y: 2)
            self.scaleImageView.alpha = 1
            
        }, completion: nil )
    }

}
