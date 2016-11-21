//
//  InterestCollectionViewCell.swift
//  Carousel Effect
//
//  Created by ChenZuo on 2016/11/21.
//  Copyright © 2016年 ChenZuo. All rights reserved.
//

import UIKit

class InterestCollectionViewCell: UICollectionViewCell {
    
    var interest : Interest! {
        didSet{
            updateUI()
        }
    }
    
    @IBOutlet weak var featuredImageView: UIImageView!
    
    @IBOutlet weak var interestTitleLabel: UILabel!
    
    fileprivate func updateUI() {
        interestTitleLabel?.text! = interest.title
        featuredImageView?.image! = interest.featuredImage
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        self.layer.cornerRadius = 5.0
        self.clipsToBounds = true
    }
}
