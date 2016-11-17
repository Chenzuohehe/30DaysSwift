//
//  VideoTableViewCell.swift
//  PlayLocalVideo
//
//  Created by ChenZuo on 2016/11/17.
//  Copyright © 2016年 ChenZuo. All rights reserved.
//

import UIKit

struct video {
    let image:String
    let title:String
    let source:String
}

class VideoTableViewCell: UITableViewCell {

    @IBOutlet weak var imageV: UIImageView!
    @IBOutlet weak var playBtn: UIButton!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var soureLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
