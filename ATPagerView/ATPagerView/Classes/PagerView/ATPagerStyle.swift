//
//  ATPagerStyle.swift
//  Pods
//
//  Created by ZGY on 2018/6/12.
//
//
//  Author:        Airfight
//  My GitHub:     https://github.com/airfight
//  My Blog:       http://airfight.github.io/
//  My Jane book:  http://www.jianshu.com/users/17d6a01e3361
//  Current Time:  2018/6/12  下午6:35
//  GiantForJade:  Efforts to do my best
//  Real developers ship.

import UIKit

public struct ATPagerStyle {
    
    /// 是否限制滚动
    public var isTitleScrollEnable: Bool = true
    
    /// titleView配置
    public var titleColor = UIColor.black
    public var titleSelectColor = UIColor.green
    public var titleFont: CGFloat = 15
    public var titleViewHeight: CGFloat = 44
    public var titleViewBgColor = UIColor.white
    public var titleMargin: CGFloat = 30
    
    
    /// BottomLine配置
    public var isShowBottomLine = true
    public var bottomLineColor = UIColor.green
    public var bottomLineHeight: CGFloat = 2
    
    /// title是否缩放
    public var isScaleEnable = true
    public var scale: CGFloat = 1.2 // 缩放系数
    
    /// Super容器
    public var isContentScrollEnable = true
    public var contentViewBgColor = UIColor.white

    
}
