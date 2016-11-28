//
//  ViewController.swift
//  SpotifyVideoBackground
//
//  Created by ChenZuo on 2016/11/28.
//  Copyright © 2016年 ChenZuo. All rights reserved.
//

import UIKit
import MediaPlayer

class ViewController: UIViewController {

    let moviePlayer : MPMoviePlayerController = MPMoviePlayerController()
    let url = URL(fileURLWithPath: Bundle.main.path(forResource: "BridgeLoop-640p", ofType: "mp4")!)
    let viewControllerFrame = UIScreen.main.bounds
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        moviePlayer.view.frame = viewControllerFrame
        moviePlayer.contentURL = url
        moviePlayer.controlStyle = .none
        moviePlayer.shouldAutoplay = true
        self.view.addSubview(moviePlayer.view)
        moviePlayer.play()
        moviePlayer.repeatMode = .one
        
        let titleLabel : UILabel = UILabel(frame: CGRect(x: 0, y: 70, width: viewControllerFrame.width, height: 20))
        titleLabel.text = "this is use MPMoviePlayerController in iOS9.0."
        titleLabel.textAlignment = .center
        titleLabel.textColor = UIColor.white
        self.view.addSubview(titleLabel)
        
        let signinLabel : UILabel = UILabel(frame: CGRect(x: 0, y: viewControllerFrame.height - 120, width: viewControllerFrame.width, height: 20))
        signinLabel.text = "sign in"
        signinLabel.textAlignment = .center
        signinLabel.textColor = UIColor.white
        self.view.addSubview(signinLabel)
        
        let signupLabel : UILabel = UILabel(frame: CGRect(x: 0, y: viewControllerFrame.height - 70, width: viewControllerFrame.width, height: 20))
        signupLabel.text = "sign up"
        signupLabel.textAlignment = .center
        signupLabel.textColor = UIColor.white
        self.view.addSubview(signupLabel)
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }

}

