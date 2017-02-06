//
//  ViewController.swift
//  PlayLocalVideo
//
//  Created by ChenZuo on 2016/11/17.
//  Copyright © 2016年 ChenZuo. All rights reserved.
//

import UIKit
import AVKit
import AVFoundation

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource{
    
    var data = [
        video(image: "videoScreenshot01", title: "Introduce 3DS Mario", source: "Youtube - 06:32"),
        video(image: "videoScreenshot02", title: "Emoji Among Us", source: "Vimeo - 3:34Vine - 00:06Vine - 00:06Vine - 00:06Vine - 00:06Vine - 00:06Vine - 00:06"),
        video(image: "videoScreenshot03", title: "Seals DocumentarySeals DocumentarySeals Documentary", source: "Vine - 00:06"),
        video(image: "videoScreenshot04", title: "Adventure Time", source: "Youtube - 02:39"),
        video(image: "videoScreenshot05", title: "Facebook HQ", source: "Facebook - 10:20"),
        video(image: "videoScreenshot06", title: "Lijiang Lugu Lake", source: "Allen - 20:30")
    ]
    
    @IBOutlet weak var mainTableView: UITableView!
    var playViewController = AVPlayerViewController()
    var playerView = AVPlayer()
    
    @IBAction func playVideoButtonDidTouch(_ sender: Any) {
        let path = Bundle.main.path(forResource: "emoji zone", ofType: "mp4")
        playerView = AVPlayer(url: URL(fileURLWithPath: path!))
        playViewController.player = playerView
        self.present(playViewController, animated: true){
            self.playViewController.player?.play()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 220
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "VideoCell", for: indexPath) as! VideoTableViewCell
        let video = data[indexPath.row]
        
        cell.imageV.image = UIImage(named: video.image)
        cell.titleLabel.text = video.title
        cell.soureLabel.text = video.source
        
        return cell
    }

}

