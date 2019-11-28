//
//  TopicDetail.swift
//  V2EX-Swift
//
//  Created by Wiley on 2019/7/5.
//  Copyright © 2019 Wiley. All rights reserved.
//

import Foundation

struct TopicDetail: Codable {
    var createdFormat: String? {
        get {
            let time = Int(Date().timeIntervalSince1970 * 1000) - created!
            if (time / 60) < 60 {
                return String("\(time / 60)" + "分钟前")
            } else if (time / 3600) < 24{
                return String("\(time / 3600)" + "小时前")
            } else {
                return String("\(time / (3600 * 24))" + "天前")
            }
        }
    }
    
    var id: Int?
    var url: String?
    var node: TopicDetailNode?
    var title: String?
    var member: Member?
    var replies: Int?
    var created: Int?
    var content: String?
    var lastReplyBy: String?
    var lastTouched: Int?
    var lastModified: Int?
    var contentRendered: String?

    enum CodingKeys: String, CodingKey {
        case id
        case url
        case node
        case title
        case member
        case replies
        case created
        case content
        case lastReplyBy = "last_reply_by"
        case lastTouched = "last_touched"
        case lastModified = "last_modified"
        case contentRendered = "content_rendered"
    }
}

struct TopicDetailNode: Codable {
    var id: Int?
    var url: String?
    var root: Bool?
    var name: String?
    var stars: Int?
    var title: String?
    var topics: Int?
    var footer: String?
    var header: String?
    var avatarMini: String?
    var avatarLarge: String?
    var avatarNormal: String?
    var parentNodeName: String?
    var titleAlternative: String?

    enum CodingKeys: String, CodingKey {
        case id
        case url
        case root
        case name
        case stars
        case title
        case topics
        case footer
        case header
        case avatarMini = "avatar_mini"
        case avatarLarge = "avatar_large"
        case avatarNormal = "avatar_normal"
        case parentNodeName = "parent_node_name"
        case titleAlternative = "title_alternative"
    }
}

struct Member: Codable {
    var avatarUrl: URL? {
        get {
            return URL(string: String("http:" + (avatarNormal ?? "")))
        }
    }
    
    var id: Int?
    var url: String?
    var psn: String?
    var bio: String?
    var btc: String?
    var github: String?
    var website: String?
    var tagline: String?
    var twitter: String?
    var created: Int?
    var location: String?
    var username: String?
    var avatarMini: String?
    var avatarLarge: String?
    var avatarNormal: String?
    
    enum CodingKeys: String, CodingKey {
        case id
        case url
        case psn
        case bio
        case btc
        case github
        case website
        case tagline
        case twitter
        case created
        case location
        case username
        case avatarMini = "avatar_mini"
        case avatarLarge = "avatar_large"
        case avatarNormal = "avatar_normal"
    }
}

struct Reply: Codable {
    var createdFormat: String? {
        get {
            let time = Int(Date().timeIntervalSince1970 * 1000) - created!
            if (time / 60) < 60 {
                return String("\(time / 60)" + "分钟前")
            } else if (time / 3600) < 24{
                return String("\(time / 3600)" + "小时前")
            } else {
                return String("\(time / (3600 * 24))" + "天前")
            }
        }
    }
    
    var id: Int?
    var member: Member?
    var created: Int?
    var topicId: Int?
    var content: String?
    var memberId: Int?
    var lastModified: Int?
    var contentRendered: String?

    enum CodingKeys: String, CodingKey {
        case id
        case member
        case created
        case topicId = "topic_id"
        case content
        case memberId = "member_id"
        case lastModified = "last_modified"
        case contentRendered = "content_rendered"
    }
}

