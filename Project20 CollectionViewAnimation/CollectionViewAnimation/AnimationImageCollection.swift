//
//  AnimationImageCollection.swift
//  CollectionViewAnimation
//
//  Created by ChenZuo on 2016/12/13.
//  Copyright © 2016年 ChenZuo. All rights reserved.
//

import UIKit
struct AnimationImageCollection {
    fileprivate let imagePaths = ["1","2","3","4","5"]
    var images: [AnimationCellModel]
    init() {
        images = imagePaths.map{AnimationCellModel(imagePath: $0)}
    }
}
