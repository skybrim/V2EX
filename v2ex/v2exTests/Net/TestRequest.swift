//
//  TestRequest.swift
//  v2exTests
//
//  Created by wiley on 2019/12/23.
//  Copyright © 2019 wiley. All rights reserved.
//

import Foundation
@testable import v2ex

struct TestRequest<T: Parsable & Codable>: RequestProtocol {
    var host: String = ""
    var path: String
    var method: HTTPMethod
    var parameters: [String: Any]?
    var headers: [String: String]?
    typealias Response = T
    
    init(_ responseType: Response.Type,
         path: String,
         method: HTTPMethod = .GET,
         parameters: [String: Any]? = nil,
         headers: [String: String]? = nil) {
        self.path = path
        self.method = method
        self.parameters = parameters
        self.headers = headers
    }
}
