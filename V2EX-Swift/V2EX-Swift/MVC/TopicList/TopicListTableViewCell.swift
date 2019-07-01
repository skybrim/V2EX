//
//  TopicListTableViewCell.swift
//  V2EX-Swift
//
//  Created by Wiley on 2019/7/1.
//  Copyright © 2019 Wiley. All rights reserved.
//

import UIKit
import SnapKit

@IBDesignable
class TopicListTableViewCell: UITableViewCell {
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - private func
    
    private func setup() {
        contentView.addSubview(avatarImageView)
//        contentView.addSubview(userNameLabel)
//        contentView.addSubview(timeLabel)
//        contentView.addSubview(nodeLabel)
//        contentView.addSubview(titleLabel)
        
        avatarImageView.snp.makeConstraints { (make) in
            make.left.equalToSuperview().offset(10)
            make.top.equalToSuperview().offset(10)
        }
    }
    
    //MARK: - subViews
    
    var avatarImageView: UIImageView = {
        let imageView = UIImageView()
        return imageView
    }()
    
    var userNameLabel: UILabel = {
        let label = UILabel()
        return label
    }()
    
    var timeLabel: UILabel = {
        let label = UILabel()
        return label
    }()
    
    var nodeLabel: UILabel = {
        let label = UILabel()
        return label
    }()
    
    var titleLabel: UILabel = {
        let label = UILabel()
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
