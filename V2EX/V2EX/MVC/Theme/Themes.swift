//
//  Themes.swift
//  V2EX-Swift
//
//  Created by wiley on 2019/6/26.
//  Copyright © 2019 Wiley. All rights reserved.
//

import Foundation

struct Themes {
    init() {
        themeInfo = [
            "tech",
            "creative",
            "play",
            "apple",
            "jobs",
            "deals",
            "city",
            "qna",
            "hot",
            "all",
            "r2",
            "nodes",
//            "members",
        ]
    }
    
    enum Function: Int {
        case account = 0
        case theme = 1
        case navigation = 2
        
        static var all = [Function.account, .theme, .navigation]
    }
    
    var themeInfo = [String]()
}


