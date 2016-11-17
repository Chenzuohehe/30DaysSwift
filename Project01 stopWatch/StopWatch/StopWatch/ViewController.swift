//
//  ViewController.swift
//  StopWatch
//
//  Created by ChenZuo on 2016/11/16.
//  Copyright © 2016年 ChenZuo. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var startBtn: UIButton!
    @IBOutlet weak var stopBtn: UIButton!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var recetBtn: UIButton!
    
    var Counter = 0.0
    var Timer = Foundation.Timer()
    var IsPlaying = false
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return UIStatusBarStyle.lightContent
    }
    
    override func viewDidLoad() {
        timeLabel.text = String(Counter)
        super.viewDidLoad()
    }
    
    @IBAction func resetButtonDidTouch(_ sender: Any) {
        Timer.invalidate();
        IsPlaying = false;
        Counter = 0.0
        timeLabel.text = String(Counter)
        startBtn.isEnabled = true;
        stopBtn.isEnabled = true;
    }
    @IBAction func startBtnDidTouch(_ sender: Any) {
        if IsPlaying {
            return
        }
        startBtn.isEnabled = false
        stopBtn.isEnabled = true
        Timer = Foundation.Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(ViewController.updateTimer), userInfo: nil, repeats: true)
        IsPlaying = true
    }
    @IBAction func stopButtonDidTouch(_ sender: Any) {
        startBtn.isEnabled = true
        stopBtn.isEnabled = false
        Timer.invalidate()
        IsPlaying = false
    }
    
    func updateTimer() {
        Counter += 0.1
        timeLabel.text = String(format: "%.1f", Counter)
    }


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }


}

