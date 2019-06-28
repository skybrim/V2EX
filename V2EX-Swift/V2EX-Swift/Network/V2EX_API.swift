//
//  V2EX_API.swift
//  V2EX-Swift
//
//  Created by Wiley on 2019/6/27.
//  Copyright © 2019 Wiley. All rights reserved.
//

import Foundation
import Moya

let vProvider = MoyaProvider<V2EX>() 

enum V2EX {
    case nodes(tab: String)
    case user(name: String)
}

extension V2EX: TargetType {
    var baseURL: URL { return URL(string: "https://www.v2ex.com")! }
    var method: Moya.Method {
        switch self {
        case .nodes, .user:
            return .get
        }
    }
    var path: String {
        switch self {
        case .nodes( _):
            return ""
        case .user(let name):
            return "/member/\(name)"
        }
    }
    var task: Task {
        switch self {
        case let .nodes(tab: tab):
            return .requestParameters(parameters: ["tab" : tab], encoding: URLEncoding.queryString)
        case .user:
            return .requestPlain
        }
    }
    var sampleData: Data { return "".data(using: String.Encoding.utf8)! }
    var headers: [String : String]? { return nil }
}

private extension String {
    var urlEscaped: String {
        return addingPercentEncoding(withAllowedCharacters: .urlHostAllowed)!
    }
    var utf8Encode: Data {
        return data(using: .utf8)!
    }
}
