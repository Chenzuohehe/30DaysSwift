//
//  NewsTableViewCell.swift
//  SlideMenu
//
//  Created by ChenZuo on 2016/12/5.
//  Copyright © 2016年 ChenZuo. All rights reserved.
//

import UIKit

class NewsTableViewCell: UITableViewCell {

    @IBOutlet weak var postImageView: UIImageView!
    @IBOutlet weak var postTitle: UILabel!
    @IBOutlet weak var authorImageView: UIImageView!
    @IBOutlet weak var postAuthor: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        authorImageView.layer.cornerRadius = authorImageView.frame.width / 2
        authorImageView.layer.masksToBounds = true
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
    }

}
