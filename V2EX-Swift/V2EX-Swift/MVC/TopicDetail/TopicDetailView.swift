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
    
    func setupUI() {
        addSubview(titleLabel)
        addSubview(mdView)
        
        self.snp.makeConstraints { (make) in
            make.width.equalTo(UIScreen.main.bounds.size.width)
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
        label.font = UIFont.preferredFont(forTextStyle: .title1)
        label.textColor = UIColor.init(hex: TextBlack)
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
