//
//  ATTitleView.swift
//  Pods
//
//  Created by ZGY on 2018/6/12.
//
//
//  Author:        Airfight
//  My GitHub:     https://github.com/airfight
//  My Blog:       http://airfight.github.io/
//  My Jane book:  http://www.jianshu.com/users/17d6a01e3361
//  Current Time:  2018/6/12  下午7:20
//  GiantForJade:  Efforts to do my best
//  Real developers ship.

import UIKit

protocol ATPagerViewDelegate {
    
    func currentTitleView(_ titleView: ATTitleView,currentIndex: Int)
}

open class ATTitleView: UIView {

    private var style: ATPagerStyle
    private(set) var titles: [String]
    private(set) var currentIndex: Int
    private(set) var titleLabels: [UILabel] = []
    
    internal var delegate: ATPagerViewDelegate?

    
    public init(frame: CGRect,style: ATPagerStyle,titles: [String],currentIndex: Int = 0) {
        self.style = style
        self.titles = titles
        self.currentIndex = currentIndex
        super.init(frame: frame)
     
        initUI()
        
    }
    
    private func initUI() {

        addSubview(scrollView)
        
        for (i,title) in titles.enumerated() {
            
            let label = UILabel()
            label.tag = i
            label.text = title
            label.textColor = i == currentIndex ? style.titleSelectColor : style.titleColor
            label.textAlignment = .center
            label.font = UIFont.systemFont(ofSize: style.titleFont)
            
            scrollView.addSubview(label)
            titleLabels.append(label)
            
            let tapGes = UITapGestureRecognizer(target: self, action: #selector(titleLabelTap(_:)))
            label.addGestureRecognizer(tapGes)
            label.isUserInteractionEnabled = true
            
        }
        
        guard style.isShowBottomLine else { return }
        
        scrollView.addSubview(bottomLine)
        
    }
    
    open override func layoutSubviews() {
        super.layoutSubviews()
        setupLayout()
    }
    
    
    
    private lazy var scrollView: UIScrollView = {
       
        let scrollerView = UIScrollView()
        scrollerView.scrollsToTop = false
        scrollerView.showsHorizontalScrollIndicator = false
        
        return UIScrollView()
    }()
    
    private lazy var bottomLine: UIView = {
        let bottomLine = UIView()
        bottomLine.backgroundColor = self.style.bottomLineColor
        return bottomLine
    }()
    
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
        
    }

}

extension ATTitleView {
    @objc func titleLabelTap(_ tapGes : UITapGestureRecognizer) {
        
        guard let label = tapGes.view as? UILabel else {
            return
        }
        
        
        if label.tag == currentIndex {
            
            return
        }
        
        let sourceLabel = titleLabels[currentIndex]
        
        sourceLabel.textColor = style.titleColor
        label.textColor = style.titleSelectColor
        
        currentIndex = label.tag
        adjustLabelPosition(label)
        
        delegate?.currentTitleView(self, currentIndex: currentIndex)
        
        if style.isScaleEnable {
            UIView.animate(withDuration: 0.2, animations: {
                sourceLabel.transform = CGAffineTransform.identity
                label.transform = CGAffineTransform(scaleX: self.style.scale, y: self.style.scale)
            })
        }
        
        if style.isShowBottomLine {
            UIView.animate(withDuration: 0.2, animations: {
                self.bottomLine.frame.origin.x = label.frame.minX
                self.bottomLine.frame.size.width = label.frame.width
            })
        }
        
    }
    
    private func adjustLabelPosition(_ seletcedlb : UILabel) {
        guard style.isTitleScrollEnable else { return }
        
        var offsetX = seletcedlb.center.x - bounds.width * 0.5
        
        if offsetX < 0 {
            offsetX = 0
        }
        if offsetX > scrollView.contentSize.width - scrollView.bounds.width {
            offsetX = scrollView.contentSize.width - scrollView.bounds.width
        }
        
        scrollView.setContentOffset(CGPoint(x: offsetX, y: 0), animated: true)
        
    }
    
    private func setupLayout() {
        
        let labelH = frame.size.height
        let labelY: CGFloat = 0
        var labelW: CGFloat = 0
        var labelX: CGFloat = 0
        
        let count = titleLabels.count
        for (i, titleLabel) in titleLabels.enumerated() {
            if style.isTitleScrollEnable {
                labelW = (titles[i] as NSString).boundingRect(with: CGSize(width: CGFloat.greatestFiniteMagnitude, height: 0), options: .usesLineFragmentOrigin, attributes: [NSAttributedStringKey.font : titleLabel.font], context: nil).width
                labelX = i == 0 ? style.titleMargin * 0.5 : (titleLabels[i-1].frame.maxX + style.titleMargin)
            } else {
                labelW = bounds.width / CGFloat(count)
                labelX = labelW * CGFloat(i)
            }
            
            titleLabel.frame = CGRect(x: labelX, y: labelY, width: labelW, height: labelH)
            
        }
        
        if style.isScaleEnable {
            titleLabels.first?.transform = CGAffineTransform(scaleX: style.scale, y: style.scale)
        }
        
        if style.isTitleScrollEnable {
            guard let titleLabel = titleLabels.last else { return }
            scrollView.contentSize.width = titleLabel.frame.maxX + style.titleMargin * 0.5
        }
        
        guard titleLabels.count - 1 >= currentIndex  else { return }
        let label = titleLabels[currentIndex]
        
        bottomLine.frame.origin.x = label.frame.origin.x
        bottomLine.frame.size.width = label.frame.width
        bottomLine.frame.size.height = self.style.bottomLineHeight
        bottomLine.frame.origin.y = self.bounds.height - self.style.bottomLineHeight
    }
    
}
