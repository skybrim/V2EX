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
    }
    
    //MARK: - private property
    
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
