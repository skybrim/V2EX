//
//  V2exHotApi.swift
//  V2EX-Hot
//
//  Created by Wiley on 2019/7/10.
//  Copyright © 2019 Wiley. All rights reserved.
//

import Foundation
import Moya

let v2exHotApiProvider = MoyaProvider<V2exHotApi>()

enum V2exHotApi{
    case topicsHot
}

extension V2exHotApi: TargetType {
    var baseURL: URL { return URL(string: "https://www.v2ex.com")! }
    var method: Moya.Method { return .get }
    var path: String {
        var rawPath = ""
        switch self {
        case .topicsHot:
            rawPath = "/api/topics/hot.json"
        }
        return rawPath
    }
    var task: Task {
        let parmeters: [String : Any] = [:]
        return .requestParameters(parameters: parmeters, encoding: URLEncoding.default)
    }
    var sampleData: Data { return "{}".data(using: String.Encoding.utf8)! }
    var headers: [String : String]? { return nil }
}
