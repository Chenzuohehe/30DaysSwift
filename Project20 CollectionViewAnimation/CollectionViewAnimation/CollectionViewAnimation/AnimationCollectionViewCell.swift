//
//  AnimationCollectionViewCell.swift
//  CollectionViewAnimation
//
//  Created by ChenZuo on 2016/12/13.
//  Copyright © 2016年 ChenZuo. All rights reserved.
//

import UIKit

class AnimationCollectionViewCell: UICollectionViewCell {

    
    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var animationImageVIew: UIImageView!
    @IBOutlet weak var animationTextView: UITextView!
    
    var backButtonTapped: (() -> Void)?
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    func prepareCell(_ viewModel:AnimationCellModel) {
        animationImageVIew.image = UIImage(named: viewModel.imagePath)
        animationTextView.isScrollEnabled = false
        backButton.isHidden = true
        
    }
    func handleCellSelected() {
        animationTextView.isScrollEnabled = false
        backButton.isHidden = false
        self.superview?.bringSubview(toFront: self)
    }
    fileprivate func addTapEventHangler() {
        backButton.addTarget(self, action: #selector(AnimationCollectionViewCell.backButtonDidTouch(_:)), for: .touchUpInside)
    }
    func backButtonDidTouch(_ sender: UIGestureRecognizer) {
        backButtonTapped?()
    }
}
