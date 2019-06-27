//
//  V2EX_API.swift
//  V2EX-Swift
//
//  Created by Wiley on 2019/6/27.
//  Copyright © 2019 Wiley. All rights reserved.
//

import Foundation
import Moya

enum V2EX {
    case nodes
    case user
}

extension V2EX: TargetType {
    var baseURL: URL { return URL(string: "")! }
    var path: String {
        switch self {
        case .nodes:
            return "/nodes"
        case .user:
            return "/user"
        }
    }
    var method: Moya.Method {
        switch self {
        case .nodes, .user:
            return .get
        }
    }
    var task: Task {
        switch self {
        case .nodes, .user:
            return .requestPlain
        }
    }
    var sampleData: Data {
        switch self {
        case .nodes:
            return "".utf8Encode
        case .user:
            return "".utf8Encode
        }
    }
    var headers: [String : String]? {
        return ["Content-type": "application/json"]
    }
}

private extension String {
    var urlEscaped: String {
        return addingPercentEncoding(withAllowedCharacters: .urlHostAllowed)!
    }
    var utf8Encode: Data {
        return data(using: .utf8)!
    }
}
