//
//  ATPagerView.swift
//  Pods
//
//  Created by ZGY on 2018/6/13.
//
//
//  Author:        Airfight
//  My GitHub:     https://github.com/airfight
//  My Blog:       http://airfight.github.io/
//  My Jane book:  http://www.jianshu.com/users/17d6a01e3361
//  Current Time:  2018/6/13  下午12:00
//  GiantForJade:  Efforts to do my best
//  Real developers ship.

import UIKit

open class ATPagerView: UIView {
    
    private (set) public var style: ATPagerStyle
    private (set) public var titles: [String]
    private (set) public var childViewControllers: [UIViewController]
    
    private (set) public lazy var titleView = ATTitleView(frame: .zero, style: style, titles: titles)
    private (set) public lazy var contentView = ATPagerContentView(frame: .zero, style: style, childViewControllers: childViewControllers)
    
    
    public init(frame: CGRect, style: ATPagerStyle, titles: [String], childViewControllers: [UIViewController]) {
        self.style = style
        self.titles = titles
        self.childViewControllers = childViewControllers
        super.init(frame: frame)
        
        setupUI()
    }
    
    public required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}


extension ATPagerView {
    private func setupUI() {
        let titleFrame = CGRect(x: 0, y: 0, width: bounds.width, height: style.titleViewHeight)
        titleView.frame = titleFrame
        addSubview(titleView)
        
        let contentFrame = CGRect(x: 0, y: style.titleViewHeight, width: bounds.width, height: bounds.height - style.titleViewHeight)
        contentView.frame = contentFrame
        contentView.backgroundColor = UIColor.white
        addSubview(contentView)
        
        titleView.delegate = contentView
//        contentView.delegate = titleView
    }
}
