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
        
        //添加子视图
        addSubview(avatarImageView)
        addSubview(userLabel)
        addSubview(timeLabel)
        addSubview(titleLabel)
        addSubview(mdView)
        
        //设置约束
        self.snp.makeConstraints { (make) in
            make.width.equalTo(CGFloat.detailWidth - 20)
        }
        avatarImageView.snp.makeConstraints { (make) in
            make.left.top.equalTo(10)
            make.size.equalTo(CGSize(width: 48, height: 48))
        }
        userLabel.snp.makeConstraints { (make) in
            make.top.equalTo(10)
            make.left.equalTo(avatarImageView.snp.right).offset(10)
        }
        timeLabel.snp.makeConstraints { (make) in
            make.top.equalTo(userLabel.snp.bottom).offset(5)
            make.left.equalTo(avatarImageView.snp.right).offset(10)
        }
        titleLabel.snp.makeConstraints { (make) in
            make.top.equalTo(avatarImageView.snp.bottom).offset(10)
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
    
    var avatarImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.layer.cornerRadius = 5.0
        imageView.clipsToBounds = true
        return imageView
    }()
    
    var userLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 1
        label.adjustsFontForContentSizeCategory = true
        label.font = UIFont.preferredFont(forTextStyle: .subheadline)
        label.textColor = UIColor.color(TextDarkGray)
        return label
    }()
    
    var timeLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 1
        label.adjustsFontForContentSizeCategory = true
        label.font = UIFont.preferredFont(forTextStyle: .caption1)
        label.textColor = UIColor.color(TextGray)
        return label
    }()
    
    var titleLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.adjustsFontForContentSizeCategory = true
        label.font = UIFont.preferredFont(forTextStyle: .title3)
        label.textColor = UIColor.color(TextBlack)
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
