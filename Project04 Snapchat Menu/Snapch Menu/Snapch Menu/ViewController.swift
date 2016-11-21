//
//  ViewController.swift
//  Snapch Menu
//
//  Created by ChenZuo on 2016/11/18.
//  Copyright © 2016年 ChenZuo. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var mainScrollView: UIScrollView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        UIApplication.shared.isStatusBarHidden = true
        let leftView: LeftViewController = LeftViewController(nibName: "LeftViewController", bundle: nil)
        let rightView: RightViewController = RightViewController(nibName: "RightViewController", bundle: nil)
        let centerView: CameraViewController = CameraViewController(nibName: "CameraViewController", bundle: nil)
        
        self.addChildViewController(leftView)
        self.mainScrollView.addSubview(leftView.view)
        leftView.didMove(toParentViewController: self)
        
        self.addChildViewController(rightView)
        self.mainScrollView.addSubview(rightView.view)
        rightView.didMove(toParentViewController: self)
        
        self.addChildViewController(centerView)
        self.mainScrollView.addSubview(centerView.view)
        centerView.didMove(toParentViewController: self)
        
        var centerViewFrame: CGRect = centerView.view.frame
        centerViewFrame.origin.x = self.view.frame.width
        centerView.view.frame = centerViewFrame
        
        var rightViewFrame: CGRect = rightView.view.frame
        rightViewFrame.origin.x = 2 * self.view.frame.width
        rightView.view.frame = rightViewFrame
        
        self.mainScrollView.contentSize = CGSize(width: self.view.frame.width * 3, height: self.view.frame.height)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }


}

