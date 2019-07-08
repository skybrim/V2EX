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
        addSubview(mdView)
        
        mdView.snp.makeConstraints { (make) in
            make.top.equalTo(0)
            make.left.equalTo(10)
            make.bottom.equalTo(0)
            make.right.equalTo(-10)
            make.width.equalToSuperview()
        }
    }
    
    
    lazy var mdView = MarkdownView()
    
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
