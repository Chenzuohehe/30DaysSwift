//
//  PatternCell.swift
//  SwipeableCell
//
//  Created by ChenZuo on 2016/12/14.
//  Copyright © 2016年 ChenZuo. All rights reserved.
//

import UIKit

struct pattern {
    let image:String
    let name: String
}

class PatternCell: UITableViewCell {

    @IBOutlet weak var patternNameLabel: UILabel!
    @IBOutlet weak var patternImageView: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }

}
