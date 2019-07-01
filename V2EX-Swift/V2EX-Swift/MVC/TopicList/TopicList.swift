//
//  TopicList.swift
//  V2EX-Swift
//
//  Created by Wiley on 2019/7/1.
//  Copyright © 2019 Wiley. All rights reserved.
//

import Foundation

struct TopicList {
    
    var topics: [Topic]
    
    init() {
        topics = [Topic]()
    }
}

struct Topic {
    
    var topicId: String?
    var avata: String?
    var nodeName: String?
    var userName: String?
    var topicTitle: String?
    
    init(_ topicNode: JiNode) {
        
        self.avata = topicNode.xPath("./table/tr/td[1]/a[1]/img[@class='avatar']").first?["src"]
        self.topicTitle = topicNode.xPath("./table/tr/td[3]/span[1]/a[1]").first?.content
        self.userName = topicNode.xPath("./table/tr/td[3]/span[1]/strong[1]/a[1]").first?.content
    }
}
