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
            "members",
        ]
    }
    
    var themeInfo = [String]()
}

struct SiteStats: Codable {
    
    let topic_max: Int
    let member_max: Int
    
    var json: Data? {
        return try? JSONEncoder().encode(self)
    }
    
    init?(json: Data) {
        if let newValue = try? JSONDecoder().decode(SiteStats.self, from: json) {
            self = newValue
        } else {
            return nil
        }
    }
}


