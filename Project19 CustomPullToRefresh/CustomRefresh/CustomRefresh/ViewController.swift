//
//  ViewController.swift
//  CustomRefresh
//
//  Created by ChenZuo on 2016/12/12.
//  Copyright © 2016年 ChenZuo. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var mainTableView: UITableView!
    
    let favoriteEmoji = ["🤗", "😅", "😆"]
    let newFavoriteEmoji = ["🐵", "🙈", "🙉", "🙊"]
    var emojiData: Array<String> = ["🐵", "🙈", "🙉", "🙊"]
    var refreshController: UIRefreshControl!
    var customView: UIView!
    var labelsArray: Array<UILabel> = []
    var isAnimating = false
    var currentColorIndex = 0
    var currentLabelIndex = 0
    var timer: Timer!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.mainTableView.register(UITableViewCell.self, forCellReuseIdentifier: "idCell")
        mainTableView.delegate = self
        mainTableView.dataSource = self
        refreshController = UIRefreshControl()
        refreshController.backgroundColor = UIColor.clear
        refreshController.tintColor = UIColor.clear
        mainTableView.addSubview(refreshController)
        
        loadCustomRefreshContents()
    }
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.emojiData.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "idCell", for: indexPath) as UITableViewCell
        cell.textLabel!.text = self.emojiData[indexPath.row]
        cell.textLabel!.textAlignment = NSTextAlignment.center
        cell.textLabel!.font = UIFont.systemFont(ofSize: 17)
        cell.backgroundColor = UIColor.clear
        cell.selectionStyle = UITableViewCellSelectionStyle.none
        return cell
    }
//
    func loadCustomRefreshContents() {
        let refreshContents = Bundle.main.loadNibNamed("RefreshContents", owner: self, options: nil)
        customView = refreshContents?[0] as! UIView
        customView.frame = refreshController.bounds
        
        for i in 0..<customView.subviews.count {
            labelsArray.append(customView.viewWithTag(i + 1) as! UILabel)
        }
        refreshController.addSubview(customView)
    }
    

//    
//    func refresh() {
//        print("refersh")
//        if (self.emojiData == favoriteEmoji) {
//            self.emojiData = newFavoriteEmoji
//        }else{
//            self.emojiData = favoriteEmoji
//        }
//        self.mainTableView.reloadData()
//        self.mainTableView.refreshControl?.endRefreshing()
//    }
//    
//    
//    // MARK: - Table view data source
//    
//    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        if refreshController.isRefreshing {
            if !isAnimating {
                
                doSomething()
                animateRefreshStep1()
                
            }
        }
    }
    
//
    func animateRefreshStep1() {
        isAnimating = true
        UIView.animate(withDuration: 0.1, delay: 0.0, options: UIViewAnimationOptions.curveLinear, animations: {
            self.labelsArray[self.currentLabelIndex].transform = CGAffineTransform(rotationAngle: CGFloat(M_PI_4))
            self.labelsArray[self.currentLabelIndex].textColor = self.getNextColor()
        }, completion: { finished in
            //finished
            UIView.animate(withDuration: 0.05, delay: 0.0, options: UIViewAnimationOptions.curveLinear, animations: {
                self.labelsArray[self.currentLabelIndex].transform = CGAffineTransform.identity
                self.labelsArray[self.currentLabelIndex].textColor = UIColor.black
            }, completion: { finished in
                self.currentLabelIndex += 1
                if self.currentLabelIndex < self.labelsArray.count{
                    self.animateRefreshStep1()
                }else{
                    self.animateRefreshStep2()
                }
            })
            
        })
    }
//    func animateRefreshStep2() {
//        UIView.animate(withDuration: 0.40, delay: 0.0, options: UIViewAnimationOptions.curveLinear, animations: { () -> Void in
//            
//            self.labelsArray[0].transform = CGAffineTransform(scaleX: 1.5, y: 1.5)
//            self.labelsArray[1].transform = CGAffineTransform(scaleX: 1.5, y: 1.5)
//            self.labelsArray[2].transform = CGAffineTransform(scaleX: 1.5, y: 1.5)
//            self.labelsArray[3].transform = CGAffineTransform(scaleX: 1.5, y: 1.5)
//            self.labelsArray[4].transform = CGAffineTransform(scaleX: 1.5, y: 1.5)
//            self.labelsArray[5].transform = CGAffineTransform(scaleX: 1.5, y: 1.5)
//            self.labelsArray[6].transform = CGAffineTransform(scaleX: 1.5, y: 1.5)
//            
//        }, completion: { (finished) -> Void in
//            
//            UIView.animate(withDuration: 0.25, delay: 0.0, options: UIViewAnimationOptions.curveLinear, animations: { () -> Void in
//                self.labelsArray[0].transform = CGAffineTransform.identity
//                self.labelsArray[1].transform = CGAffineTransform.identity
//                self.labelsArray[2].transform = CGAffineTransform.identity
//                self.labelsArray[3].transform = CGAffineTransform.identity
//                self.labelsArray[4].transform = CGAffineTransform.identity
//                self.labelsArray[5].transform = CGAffineTransform.identity
//                self.labelsArray[6].transform = CGAffineTransform.identity
//                
//            }, completion: { (finished) -> Void in
//                if self.refreshController.isRefreshing {
//                    self.currentLabelIndex = 0
//                    self.animateRefreshStep1()
//                }
//                else {
//                    self.isAnimating = false
//                    self.currentLabelIndex = 0
//                    for i in 0..<self.labelsArray.count {
//                        self.labelsArray[i].textColor = UIColor.black
//                        self.labelsArray[i].transform = CGAffineTransform.identity
//                    }
//                }
//            })
//        })
//    }
    
//    
    func animateRefreshStep2() {
        UIView.animate(withDuration: 0.40, delay: 0.0, options: UIViewAnimationOptions.curveLinear, animations: { () -> Void in
            
            self.labelsArray[0].transform = CGAffineTransform(scaleX: 1.5, y: 1.5)
            self.labelsArray[1].transform = CGAffineTransform(scaleX: 1.5, y: 1.5)
            self.labelsArray[2].transform = CGAffineTransform(scaleX: 1.5, y: 1.5)
            self.labelsArray[3].transform = CGAffineTransform(scaleX: 1.5, y: 1.5)
            self.labelsArray[4].transform = CGAffineTransform(scaleX: 1.5, y: 1.5)
            self.labelsArray[5].transform = CGAffineTransform(scaleX: 1.5, y: 1.5)
            self.labelsArray[6].transform = CGAffineTransform(scaleX: 1.5, y: 1.5)
            
            
        }, completion: { (finished) -> Void in
            
            UIView.animate(withDuration: 0.25, delay: 0.0, options: UIViewAnimationOptions.curveLinear, animations: { () -> Void in
                self.labelsArray[0].transform = CGAffineTransform.identity
                self.labelsArray[1].transform = CGAffineTransform.identity
                self.labelsArray[2].transform = CGAffineTransform.identity
                self.labelsArray[3].transform = CGAffineTransform.identity
                self.labelsArray[4].transform = CGAffineTransform.identity
                self.labelsArray[5].transform = CGAffineTransform.identity
                self.labelsArray[6].transform = CGAffineTransform.identity
                
                
            }, completion: { (finished) -> Void in
                if self.refreshController.isRefreshing {
                    self.currentLabelIndex = 0
                    self.self.animateRefreshStep1()
                }
                else {
                    self.isAnimating = false
                    self.currentLabelIndex = 0
                    for i in 0..<self.labelsArray.count {
                        self.labelsArray[i].textColor = UIColor.black
                        self.labelsArray[i].transform = CGAffineTransform.identity
                    }
                }
            })
        })
    }
//
    func getNextColor() -> UIColor {
        var colorsArray = [UIColor.magenta, UIColor.brown, UIColor.yellow, UIColor.red, UIColor.green, UIColor.blue, UIColor.orange, UIColor.black]
        if currentColorIndex == colorsArray.count {
            currentColorIndex = 0
        }
        let returnColor = colorsArray[currentColorIndex]
        currentColorIndex += 1
        return returnColor
    }

    func doSomething() {
        
        timer = Timer.scheduledTimer(timeInterval: 5, target: self, selector: #selector(ViewController.endedOfWork), userInfo: nil, repeats: true)
    }
    func endedOfWork() {
//        print("refersh")
//        if (self.emojiData == favoriteEmoji) {
//            self.emojiData = newFavoriteEmoji
//        }else{
//            self.emojiData = favoriteEmoji
//        }
//        self.mainTableView.reloadData()
        
        self.mainTableView.refreshControl?.endRefreshing()
        timer.invalidate()
        timer = nil
    }
    
    
    
    
    
    
//    func getNextColor() -> UIColor {
//        var colorsArray: Array<UIColor> = [UIColor.magenta, UIColor.brown, UIColor.yellow, UIColor.red, UIColor.green, UIColor.blue, UIColor.orange]
//        
//        if currentColorIndex == colorsArray.count {
//            currentColorIndex = 0
//        }
//        
//        let returnColor = colorsArray[currentColorIndex]
//        currentColorIndex += 1
//        
//        return returnColor
//    }
//    
//    
//    
//    func doSomething() {
//        
//        timer = Timer.scheduledTimer(timeInterval: 5, target: self, selector: #selector(ViewController.endedOfWork), userInfo: nil, repeats: true)
//    }
//    
//    func endedOfWork() {
//        
//        refreshController.endRefreshing()
//        timer.invalidate()
//        timer = nil
//    }
}

