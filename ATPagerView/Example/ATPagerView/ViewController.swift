//
//  ViewController.swift
//  ATPagerView
//
//  Created by airfight on 06/12/2018.
//  Copyright (c) 2018 airfight. All rights reserved.
//

import UIKit
import ATPagerView

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        automaticallyAdjustsScrollViewInsets = false
        
        // 创建DNSPageStyle，设置样式
        let style = ATPagerStyle()
        
        // 设置标题内容
        let titles = ["头条", "视频集", "娱乐不好说", "要", "体育不" , "科技" , "汽车" , "时尚" , "图片" , "游戏" , "房产"]
        
        // 创建每一页对应的controller
        let childViewControllers: [UIViewController] = titles.map { _ -> UIViewController in
            let controller = UIViewController()
            controller.view.backgroundColor = UIColor.red
            return controller
        }
        
        let size = UIScreen.main.bounds.size
        
        // 创建对应的DNSPageView，并设置它的frame
        let pageView = ATPagerView(frame: CGRect(x: 0, y: 64, width: size.width, height: size.height), style: style, titles: titles, childViewControllers: childViewControllers)
        view.addSubview(pageView)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

