//
//  ColorViewController.swift
//  BasicAnimation
//
//  Created by ChenZuo on 2016/12/21.
//  Copyright © 2016年 ChenZuo. All rights reserved.
//

import UIKit

class ColorViewController: UIViewController {

    @IBOutlet weak var bgColorView: UIView!
    @IBOutlet weak var numberLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        
        UIView.animate(withDuration: 0.5, delay: 0.2, options: .curveEaseIn, animations: { () -> Void in
            
            self.bgColorView.backgroundColor = UIColor.black
            
        }, completion: nil )
        
        UIView.animate(withDuration: 0.5, delay: 0.8, options: .curveEaseOut, animations: { () -> Void in
            
            self.numberLabel.textColor = UIColor(red:0.959, green:0.937, blue:0.109, alpha:1)
            
        }, completion: nil)
    }

}
