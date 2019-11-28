//
//  User.swift
//  V2EX-Swift
//
//  Created by Wiley on 2019/7/1.
//  Copyright © 2019 Wiley. All rights reserved.
//

import Foundation

struct User: Codable {
    var id: String?
    var psn: String?
    var bio: String?
    var url: String?
    var btc: String?
    var github: String?
    var status: String?
    var website: String?
    var tagline: String?
    var twitter: String?
    var created: String?
    var username: String?
    var location: String?
    var avatarMini: String?
    var avatarLarge: String?
    var avatarNormal: String?

    enum CodingKeys: String, CodingKey {
        case id
        case psn
        case bio
        case url
        case btc
        case github
        case status
        case website
        case tagline
        case twitter
        case created
        case username
        case location
        case avatarMini = "avatar_mini"
        case avatarLarge = "avatar_large"
        case avatarNormal = "avatar_normal"
    }
}
