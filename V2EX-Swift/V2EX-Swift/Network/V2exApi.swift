//
//  V2exApi.swift
//  V2EX-Swift
//
//  Created by Wiley on 2019/7/1.
//  Copyright © 2019 Wiley. All rights reserved.
//

import Foundation
import Moya

let v2exApiProvider = MoyaProvider<V2exApi>()

enum V2exApi{
    case siteInfo
    case siteStats
    
    case nodesAll
    case nodesShow(id: String, name: String)
    
    case topicsHot
    case topicsLatest
    case topicsShow(id: String)
    
    case repliesShow(topic_id: String)
    
    case membersShow(username: String)
}

extension V2exApi: TargetType {
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
        case .topicsShow(_):
            rawPath = "/api/topics/show.json"
        case .repliesShow(_):
            rawPath = "/api/replies/show.json"
        case .membersShow(_):
            rawPath = "/api/members/show.json"
        }
        return rawPath
    }
    var task: Task {
        var parmeters: [String : Any] = [:]
        switch self {
        case .nodesShow(let id, let name):
            parmeters["id"] = id
            parmeters["name"] = name
        case .topicsShow(let id):
            parmeters["id"] = id
        case .repliesShow(let topic_id):
            parmeters["topic_id"] = topic_id
        case .membersShow(let username):
            parmeters["username"] = username
        default:
            break
        }
        return .requestParameters(parameters: parmeters, encoding: URLEncoding.default)
    }
    var sampleData: Data { return "{}".data(using: String.Encoding.utf8)! }
    var headers: [String : String]? { return nil }
}
