//
//  User.swift
//  V2EX-Swift
//
//  Created by Wiley on 2019/7/1.
//  Copyright © 2019 Wiley. All rights reserved.
//

import Foundation

struct User: Codable {
    
    var username: String?
    var website: String?
    var github: String?
    var psn: String?
    var avatarNormal: String?
    var bio: String?
    var url: String?
    var tagline: String?
    var twitter: String?
    var created: String?
    var status: String?
    var avatarLarge: String?
    var avatarMini: String?
    var location: String?
    var btc: String?
    var id: String?
    
    enum CodingKeys: String, CodingKey {
        case username
        case website
        case github
        case psn
        case avatarNormal = "avatar_normal"
        case bio
        case url
        case tagline
        case twitter
        case created
        case status
        case avatarLarge = "avatar_large"
        case avatarMini = "avatar_mini"
        case location
        case btc
        case id
    }
}
