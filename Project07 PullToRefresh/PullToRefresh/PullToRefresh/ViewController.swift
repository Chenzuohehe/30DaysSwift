//
//  ViewController.swift
//  PullToRefresh
//
//  Created by ChenZuo on 2016/11/23.
//  Copyright © 2016年 ChenZuo. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    let cellIdentifer = "NewCellIdentifier"
    let favoriteEmoji = ["🤗🤗🤗🤗🤗", "😅😅😅😅😅", "😆😆😆😆😆"]
    let newFavoriteEmoji = ["🏃🏃🏃🏃🏃", "💩💩💩💩💩", "👸👸👸👸👸", "🤗🤗🤗🤗🤗", "😅😅😅😅😅", "😆😆😆😆😆" ]
    var emojiData = [String]()
    var tableViewController = UITableViewController(style: .plain)
    var refreshController = UIRefreshControl()
    var navBar : UINavigationBar = UINavigationBar(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 64))
    var flag = true
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        emojiData = favoriteEmoji
        let emojiTableView = tableViewController.tableView
        emojiTableView?.frame = CGRect(x: 0, y: 64, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height - 64)
        emojiTableView?.backgroundColor = UIColor(red: 0.092, green: 0.096, blue: 0.116, alpha: 1)
        emojiTableView?.dataSource = self
        emojiTableView?.delegate = self
        emojiTableView?.register(UITableViewCell.self, forCellReuseIdentifier: cellIdentifer)
        tableViewController.refreshControl = self.refreshController
        self.refreshController.addTarget(self, action: #selector(ViewController.didRoadEmoji), for: .valueChanged)
        self.refreshController.backgroundColor = UIColor(red: 0.113, green: 0.113, blue: 0.145, alpha: 1)
        let attrbutes = [NSForegroundColorAttributeName: UIColor.white]
        self.refreshController.attributedTitle = NSAttributedString(string: "Last updated on \(Date())", attributes: attrbutes)
        self.refreshController.tintColor = UIColor.white
        
        self.title = "emoji"
        self.navBar.barStyle = .blackTranslucent
        emojiTableView?.rowHeight = UITableViewAutomaticDimension
        emojiTableView?.estimatedRowHeight = 60.0
        emojiTableView?.tableFooterView = UIView(frame: CGRect.zero)
        emojiTableView?.separatorStyle = .none
        
        self.view.addSubview(emojiTableView!)
        self.view.addSubview(navBar)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return emojiData.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifer, for: indexPath)
        cell.textLabel?.text = self.emojiData[indexPath.row]
        cell.textLabel?.textAlignment = .center
        cell.textLabel?.font = UIFont.systemFont(ofSize: 30)
        cell.backgroundColor = UIColor.clear
        cell.selectionStyle = .none
        return cell
    }
    func didRoadEmoji() {
        if flag {
            self.emojiData = newFavoriteEmoji
        }else{
            self.emojiData = favoriteEmoji
        }
        flag = !flag
        self.tableViewController.tableView.reloadData()
        self.refreshController.endRefreshing()
    }
    
    override var preferredStatusBarStyle : UIStatusBarStyle {
        return UIStatusBarStyle.lightContent
    }
}

