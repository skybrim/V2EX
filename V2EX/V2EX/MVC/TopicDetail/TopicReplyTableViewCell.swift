//
//  TopicReplyTableViewCell.swift
//  V2EX-Swift
//
//  Created by Wiley on 2019/7/5.
//  Copyright © 2019 Wiley. All rights reserved.
//

import UIKit

class TopicReplyTableViewCell: UITableViewCell {
    //MARK: -
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    //MARK: - praivete function
    
    func setupUI() {
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
        contentView.addSubview(avatarImageView)
        contentView.addSubview(userLabel)
        contentView.addSubview(tagLabel)
        contentView.addSubview(timeLabel)
        contentView.addSubview(contentLabel)
        
        //添加约束
        avatarImageView.snp.makeConstraints { (make) in
            make.left.top.equalTo(10)
            make.size.equalTo(CGSize(width: 48, height: 48))
        }
        userLabel.snp.makeConstraints { (make) in
            make.top.equalTo(10)
            make.left.equalTo(avatarImageView.snp.right).offset(10)
        }
        tagLabel.snp.makeConstraints { (make) in
            make.left.equalTo(userLabel.snp.right).offset(5)
            make.centerY.equalTo(userLabel.snp.centerY)
        }
        timeLabel.snp.makeConstraints { (make) in
            make.top.equalTo(userLabel.snp.bottom).offset(5)
            make.left.equalTo(avatarImageView.snp.right).offset(10)
        }
        contentLabel.snp.makeConstraints { (make) in
            make.top.equalTo(avatarImageView.snp.bottom).offset(10)
            make.left.equalTo(10)
            make.right.equalTo(-10)
            make.bottom.equalTo(-10)
        }
    }
    
    //MARK: - property
    
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
        label.textColor = UIColor.init(hex: TextDarkGray)
        return label
    }()
    
    var tagLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 1
        label.adjustsFontForContentSizeCategory = true
        label.font = UIFont.preferredFont(forTextStyle: .caption1)
        label.textColor = UIColor.init(hex: TextDarkGray)
        label.text = " 楼主 "
        label.layer.borderColor = UIColor.init(hex: TextDarkGray)?.cgColor
        label.layer.borderWidth = 0.5
        label.layer.cornerRadius = 3.0
        return label
    }()
    
    var timeLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 1
        label.adjustsFontForContentSizeCategory = true
        label.font = UIFont.preferredFont(forTextStyle: .caption1)
        label.textColor = UIColor.init(hex: TextGray)
        return label
    }()
    
    var contentLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.adjustsFontForContentSizeCategory = true
        label.font = UIFont.preferredFont(forTextStyle: .body)
        label.textColor = UIColor.init(hex: TextBlack)
        return label
    }()
    
    //MARK: -
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
