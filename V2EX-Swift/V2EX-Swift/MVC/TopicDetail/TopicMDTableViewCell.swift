//
//  TopicMDTableViewCell.swift
//  V2EX-Swift
//
//  Created by Wiley on 2019/7/5.
//  Copyright © 2019 Wiley. All rights reserved.
//

import UIKit
import MarkdownView

class TopicMDTableViewCell: UITableViewCell {
    //MARK: - init
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    //MARK: - private func
    
    private func setupUI() {
        addSubview(mdView)
      
        mdView.snp.makeConstraints { (make) in
            make.left.top.equalTo(10)
            make.right.bottom.equalTo(-10)
            make.height.greaterThanOrEqualTo(0)
        }
    }
    
    //MARK: - property
    
    lazy var mdView: MarkdownView = createMD()
    
    func createMD() -> MarkdownView {
        let md = MarkdownView()
        md.onRendered = { height in
            md.snp.updateConstraints({ (make) in
                make.height.greaterThanOrEqualTo(height)
            })
            self.layoutIfNeeded()
        }
        return md
    }
    
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
