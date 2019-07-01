//
//  V2exUrl.swift
//  V2EX-Swift
//
//  Created by Wiley on 2019/7/1.
//  Copyright © 2019 Wiley. All rights reserved.
//

import Foundation
import Moya
@_exported import Ji

let v2exUrlProvider = MoyaProvider<V2exUrl>()

enum V2exUrl{
    case topicList(tab: String?) //获取首页列表
    case favoriteList(page: Int) //获取我的收藏帖子列表
    case nodeTopicList(nodeName: String, page:Int) //获取节点主题列表
}

extension V2exUrl: TargetType {
    var baseURL: URL { return URL(string: "https://www.v2ex.com")! }
    var method: Moya.Method { return .get }
    var path: String {
        var rawPath = ""
        switch self {
        case .topicList(_):
            rawPath = "/"
        case .favoriteList(_):
            rawPath = "/my/topics"
        case .nodeTopicList(let nodeName, _):
            rawPath = "/go/\(nodeName)"
        }
        return rawPath
    }
    var task: Task {
        var parmeters: [String : Any] = [:]
        switch self {
        case .topicList(let tab):
            parmeters["tab"] = tab ?? "all"
        case .favoriteList(let page):
            parmeters["p"] = page
        case .nodeTopicList(_, let page):
            parmeters["p"] = page
        }
        return .requestParameters(parameters: parmeters, encoding: URLEncoding.default)
    }
    var sampleData: Data { return "{}".data(using: String.Encoding.utf8)! }
    var headers: [String : String]? { return nil }
}
