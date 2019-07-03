//
//  TopicListTableViewCell.swift
//  V2EX-Swift
//
//  Created by Wiley on 2019/7/3.
//  Copyright © 2019 Wiley. All rights reserved.
//

import UIKit

class TopicListTableViewCell: UITableViewCell {

    //MARK: - private func
    
    private func setupUI() {
        
    }
    
    //MARK: - property
    
    var avatarImageView: UIImageView = {
       let imageView = UIImageView()
        return imageView
    }()
    
    var userLabel: UILabel = {
        let label = UILabel()
        return label
    }()
    
    var nodeLabel: UILabel = {
        let label = UILabel()
        return label
    }()
    
    var detailLabel: UILabel = {
        let label = UILabel()
        return label
    }()
    
    var titleLabel: UILabel = {
        let label = UILabel()
        return label
    }()
    
    var replayCountLabel: UILabel = {
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
