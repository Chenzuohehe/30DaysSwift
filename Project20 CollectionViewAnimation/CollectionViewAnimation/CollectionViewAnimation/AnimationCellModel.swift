//
//  AnimationCellModel.swift
//  CollectionViewAnimation
//
//  Created by ChenZuo on 2016/12/13.
//  Copyright © 2016年 ChenZuo. All rights reserved.
//

import Foundation

struct AnimationCellModel {
    let imagePath: String
    init(imagePath: String?) {
        self.imagePath = imagePath ?? ""
    }
}
