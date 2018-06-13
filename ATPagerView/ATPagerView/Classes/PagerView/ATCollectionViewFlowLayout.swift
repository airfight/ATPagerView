//
//  ATCollectionViewFlowLayout.swift
//  Pods
//
//  Created by ZGY on 2018/6/13.
//
//
//  Author:        Airfight
//  My GitHub:     https://github.com/airfight
//  My Blog:       http://airfight.github.io/
//  My Jane book:  http://www.jianshu.com/users/17d6a01e3361
//  Current Time:  2018/6/13  上午11:13
//  GiantForJade:  Efforts to do my best
//  Real developers ship.

import UIKit

open class ATCollectionViewFlowLayout: UICollectionViewFlowLayout {

    var offset: CGFloat?
    
    override open func prepare() {
        super.prepare()
        guard let offset = offset else { return }
        collectionView?.contentOffset = CGPoint(x: offset, y: 0)
    }
    
}
