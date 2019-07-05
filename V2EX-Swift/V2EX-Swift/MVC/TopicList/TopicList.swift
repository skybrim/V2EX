//
//  TopicList.swift
//  V2EX-Swift
//
//  Created by Wiley on 2019/7/1.
//  Copyright © 2019 Wiley. All rights reserved.
//

import Foundation

struct TopicList {
    init() {
        topics = [Topic]()
    }
    
    var topics: [Topic]
}

struct Topic {
    init(_ topicNode: JiNode) {
        self.avatar = topicNode.xPath("./table/tr/td[1]/a[1]/img[@class='avatar']").first?["src"]
        self.nodeName = topicNode.xPath("./table/tr/td[3]/span[@class='topic_info']/a[@class='node']").first?.content
        self.userName = topicNode.xPath("./table/tr/td[3]/span[@class='topic_info']/strong[1]/a[1]").first?.content
        self.replyCount = topicNode.xPath("./table/tr/td[4]/a[@class='count_livid']").first?.content
        //标题
        let titleNode = topicNode.xPath("./table/tr/td[3]/span[@class='item_title']/a[1]").first
        self.topicTitle = titleNode?.content
        //topic ID
        var topicIdUrl = titleNode?["href"];
        if var id = topicIdUrl {
            if let range = id.range(of: "/t/") {
                id.replaceSubrange(range, with: "");
            }
            if let range = id.range(of: "#") {
                topicIdUrl = String(id[..<range.lowerBound])
            }
        }
        self.topicID = topicIdUrl
        //详情
        if let detailString = topicNode.xPath("./table/tr/td[3]/span[@class='topic_info']").first?.content {
            if let tmpDetail = detailString.components(separatedBy: self.userName!).last,
                tmpDetail.hasPrefix("  •  ") {
                self.topicDetail = String(tmpDetail.suffix(tmpDetail.count - 5) + "  •  \(self.replyCount ?? "0")")
            }
        }
    }
    
    var avatar: String?
    var topicID: String?
    var nodeName: String?
    var userName: String?
    var replyCount: String?
    var topicTitle: String?
    var topicDetail: String?
}
