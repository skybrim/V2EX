//
//  V2EX_API.swift
//  V2EX-Swift
//
//  Created by Wiley on 2019/6/27.
//  Copyright © 2019 Wiley. All rights reserved.
//

import Foundation
import Moya
import HandyJSON

let vProvider = MoyaProvider<V2EX>() 

enum V2EX {
    case siteInfo
    case siteStats
    case nodesAll
    case nodesShow(id: String, name: String)
    case topicsLatest
    case topicsHot
//    case topicsShow(id: String)
    case topicsShow(username: String, node_id: String, node_name: String)
    case repliesShow(topic_id: String, page: Int, page_size: Int)
    case membersShow(username: String)
}

extension V2EX: TargetType {
    var baseURL: URL { return URL(string: "https://www.v2ex.com")! }
    var method: Moya.Method { return .get }
    var path: String {
        var rawPath = ""
        switch self {
        case .siteInfo:
            rawPath = "/api/site/info.json"
        case .siteStats:
            rawPath = "/api/site/stats.json"
        case .nodesAll:
            rawPath = "/api/nodes/all.json"
        case .nodesShow(_, _):
            rawPath = "/api/nodes/show.json"
        case .topicsLatest:
            rawPath = "/api/topics/latest.json"
        case .topicsHot:
            rawPath = "/api/topics/hot.json"
        case .topicsShow(_, _, _):
            rawPath = "/api/topics/show.json"
        case .repliesShow(_, _, _):
            rawPath = "/api/topics/show.json"
        case .membersShow(_):
            rawPath = "/api/members/show.json"
        }
        print(self.baseURL.absoluteString + rawPath)
        return rawPath
    }
    var task: Task {
        var parmeters: [String : Any] = [:]
        switch self {
        case .nodesShow(let id, let name):
            parmeters["id"] = id
            parmeters["name"] = name
        case .topicsShow(let username, let node_id, let node_name):
            parmeters["username"] = username
            parmeters["node_id"] = node_id
            parmeters["node_name"] = node_name
        case .repliesShow(let topic_id, let page, let page_size):
            parmeters["topic_id"] = topic_id
            parmeters["page"] = page
            parmeters["page_size"] = page_size
        case .membersShow(let username):
            parmeters["username"] = username
        default:
            break
        }
        return .requestParameters(parameters: parmeters, encoding: JSONEncoding.default)
    }
    var sampleData: Data { return "".data(using: String.Encoding.utf8)! }
    var headers: [String : String]? { return nil }
}

