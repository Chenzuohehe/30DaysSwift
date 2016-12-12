//
//  MainTableViewController.swift
//  CustomPullToRefresh
//
//  Created by ChenZuo on 2016/12/8.
//  Copyright © 2016年 ChenZuo. All rights reserved.
//

import UIKit

class MainTableViewController: UITableViewController {
    
    let favoriteEmoji = ["🤗", "😅", "😆"]
    let newFavoriteEmoji = ["🐵", "🙈", "🙉", "🙊"]
    var emojiData = [String]()
    var myRefreshControl = UIRefreshControl()
    let customView = Bundle.main.loadNibNamed("RefreshContents", owner: self, options: nil)?[0] as! UIView
    var labelArray: Array<UILabel> = []
    var isAnimationing = false
    var currentColorIndex = 0
    var currentLabelIndex = 0
    var timer: Timer!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.emojiData = favoriteEmoji
        self.tableView.refreshControl = myRefreshControl
//        myRefreshControl.addTarget(self, action: #selector(MainTableViewController.refresh), for: .valueChanged)
        self.tableView.register(UITableViewCell.self, forCellReuseIdentifier: "reuseIdentifier")
    }
    
    func loadCustomRefreshContents() {
        customView.frame = (self.refreshControl?.bounds)!
        for i in 0..<customView.subviews.count {
            labelArray.append(customView.viewWithTag(i + 1) as! UILabel)
        }
    }

    func refresh() {
        print("refersh")
        if (self.emojiData == favoriteEmoji) {
            self.emojiData = newFavoriteEmoji
        }else{
            self.emojiData = favoriteEmoji
        }
        self.tableView.reloadData()
        self.refreshControl?.endRefreshing()
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        
        return 1
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.emojiData.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath) as UITableViewCell
        cell.textLabel!.text = self.emojiData[indexPath.row]
        cell.textLabel!.textAlignment = NSTextAlignment.center
        cell.textLabel!.font = UIFont.systemFont(ofSize: 17)
        cell.backgroundColor = UIColor.clear
        cell.selectionStyle = UITableViewCellSelectionStyle.none
        return cell
    }
    override func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        if (self.refreshControl?.isRefreshing)! {
            if !isAnimationing {
                //开始动画
                doSomething()
                animateRefresh()
            }
        }
    }
    func doSomething() {
        
        timer = Timer.scheduledTimer(timeInterval: 5, target: self, selector: #selector(MainTableViewController.endedOfWork), userInfo: nil, repeats: true)
    }
    func endedOfWork() {
        print("refersh")
        if (self.emojiData == favoriteEmoji) {
            self.emojiData = newFavoriteEmoji
        }else{
            self.emojiData = favoriteEmoji
        }
        self.tableView.reloadData()
        
        self.refreshControl?.endRefreshing()
        timer.invalidate()
        timer = nil
    }
    func animateRefresh() {
        isAnimationing = true
        UIView.animate(withDuration: 0.1, delay: 0.0, options: UIViewAnimationOptions.curveLinear, animations: {
            self.labelArray[self.currentLabelIndex].transform = CGAffineTransform(rotationAngle: CGFloat(M_PI_4))
            self.labelArray[self.currentLabelIndex].textColor = self.getNextColor()
        }, completion: { finished in
            //finished
            UIView.animate(withDuration: 0.05, delay: 0.0, options: UIViewAnimationOptions.curveLinear, animations: {
                self.labelArray[self.currentLabelIndex].transform = CGAffineTransform.identity
                self.labelArray[self.currentLabelIndex].textColor = UIColor.black
            }, completion: { finished in
                self.currentLabelIndex += 1
                if self.currentLabelIndex < self.labelArray.count{
                    self.animateRefresh()
                }else{
                    self.animateRefresh2()
                }
            })
            
        })
    }
    
    func animateRefresh2() {
        UIView.animate(withDuration: 0.40, delay: 0.0, options: UIViewAnimationOptions.curveLinear, animations: { () -> Void in
            
            self.labelArray[0].transform = CGAffineTransform(scaleX: 1.5, y: 1.5)
            self.labelArray[1].transform = CGAffineTransform(scaleX: 1.5, y: 1.5)
            self.labelArray[2].transform = CGAffineTransform(scaleX: 1.5, y: 1.5)
            self.labelArray[3].transform = CGAffineTransform(scaleX: 1.5, y: 1.5)
            self.labelArray[4].transform = CGAffineTransform(scaleX: 1.5, y: 1.5)
            self.labelArray[5].transform = CGAffineTransform(scaleX: 1.5, y: 1.5)
            self.labelArray[6].transform = CGAffineTransform(scaleX: 1.5, y: 1.5)
            self.labelArray[7].transform = CGAffineTransform(scaleX: 1.5, y: 1.5)
            self.labelArray[8].transform = CGAffineTransform(scaleX: 1.5, y: 1.5)
            self.labelArray[9].transform = CGAffineTransform(scaleX: 1.5, y: 1.5)
            self.labelArray[10].transform = CGAffineTransform(scaleX: 1.5, y: 1.5)
            self.labelArray[11].transform = CGAffineTransform(scaleX: 1.5, y: 1.5)
            
        }, completion: { (finished) -> Void in
            
            UIView.animate(withDuration: 0.25, delay: 0.0, options: UIViewAnimationOptions.curveLinear, animations: { () -> Void in
                self.labelArray[0].transform = CGAffineTransform.identity
                self.labelArray[1].transform = CGAffineTransform.identity
                self.labelArray[2].transform = CGAffineTransform.identity
                self.labelArray[3].transform = CGAffineTransform.identity
                self.labelArray[4].transform = CGAffineTransform.identity
                self.labelArray[5].transform = CGAffineTransform.identity
                self.labelArray[6].transform = CGAffineTransform.identity
                self.labelArray[7].transform = CGAffineTransform.identity
                self.labelArray[8].transform = CGAffineTransform.identity
                self.labelArray[9].transform = CGAffineTransform.identity
                self.labelArray[10].transform = CGAffineTransform.identity
                self.labelArray[11].transform = CGAffineTransform.identity
                
            }, completion: { (finished) -> Void in
                if (self.refreshControl?.isRefreshing)! {
                    self.currentLabelIndex = 0
                    self.animateRefresh()
                }
                else {
                    self.isAnimationing = false
                    self.currentLabelIndex = 0
                    for i in 0..<self.labelArray.count {
                        self.labelArray[i].textColor = UIColor.black
                        self.labelArray[i].transform = CGAffineTransform.identity
                    }
                }
            })
        })
    }
    
    func getNextColor() -> UIColor {
        var colorsArray = [UIColor.magenta, UIColor.brown, UIColor.yellow, UIColor.red, UIColor.green, UIColor.blue, UIColor.orange, UIColor.black]
        if currentColorIndex == colorsArray.count {
            currentColorIndex = 0
        }
        let returnColor = colorsArray[currentColorIndex]
        currentColorIndex += 1
        return returnColor
    }
}
