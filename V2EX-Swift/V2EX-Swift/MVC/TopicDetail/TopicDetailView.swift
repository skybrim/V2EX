//
//  TopicDetailView.swift
//  V2EX-Swift
//
//  Created by Wiley on 2019/7/8.
//  Copyright © 2019 Wiley. All rights reserved.
//

import UIKit
import MarkdownView

class TopicDetailView: UIView {

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    private func setupUI() {
        //全屏分割线
        //2.调整(iOS8以上)tableView边距
        if self.responds(to: #selector(setter: preservesSuperviewLayoutMargins)) {
            self.preservesSuperviewLayoutMargins = false
        }
        //3.调整(iOS8以上)view边距
        if self.responds(to: #selector(setter: layoutMargins)) {
            self.layoutMargins = UIEdgeInsets.zero
        }
        addSubview(titleLabel)
        addSubview(mdView)
        
        self.snp.makeConstraints { (make) in
            make.width.equalTo(CGFloat.detailWidth - 20)
        }
        titleLabel.snp.makeConstraints { (make) in
            make.top.equalTo(10)
            make.left.equalTo(10)
            make.right.equalTo(-10)
        }
        mdView.snp.makeConstraints { (make) in
            make.top.equalTo(titleLabel.snp.bottom).offset(10)
            make.left.equalTo(10)
            make.bottom.equalTo(-10)
            make.right.equalTo(-10)
        }
    }
    
    var titleLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.adjustsFontForContentSizeCategory = true
        label.font = UIFont.preferredFont(forTextStyle: .title3)
        label.textColor = UIColor.init(hex: TextBlack)
        label.sizeToFit()
        return label
    }()
    
    var mdView = MarkdownView()
    
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
