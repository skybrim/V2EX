//
//  Nodes.swift
//  V2EX-Swift
//
//  Created by wiley on 2019/6/26.
//  Copyright © 2019 Wiley. All rights reserved.
//

import Foundation

struct Nodes {
    
    init() {
        nodesInfo = [
            NSLocalizedString("tech", comment: "Technology"),
            NSLocalizedString("creative", comment: "Creative"),
            NSLocalizedString("play", comment: "Play"),
            NSLocalizedString("apple", comment: "Apple"),
            NSLocalizedString("jobs", comment: "Jobs"),
            NSLocalizedString("deals", comment: "Deals"),
            NSLocalizedString("city", comment: "City"),
            NSLocalizedString("qa", comment: "Q&A"),
            NSLocalizedString("hot", comment: "Hot"),
            NSLocalizedString("all", comment: "All"),
            NSLocalizedString("r2", comment: "R2"),
            NSLocalizedString("nodes", comment: "Nodes"),
            NSLocalizedString("members", comment: "Members"),
        ]
    }
    
    var nodesInfo = [String]()
}
