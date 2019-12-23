//
//  TestSession.swift
//  v2exTests
//
//  Created by wiley on 2019/12/23.
//  Copyright © 2019 wiley. All rights reserved.
//

import Foundation
@testable import v2ex
@testable import Alamofire

struct TestSession: Session {
    static let shared = TestSession()
    private init() {}
    
    /// # 发送请求
    func send<T: Request>(_ request: T, handler: @escaping (Result<T.Response, Error>) -> Void) {
        guard let url = URL(string: request.host + request.path) else {
            return
        }
        let method = Alamofire.HTTPMethod(rawValue: request.method.rawValue)
        let headers =  Alamofire.HTTPHeaders(request.headers ?? [:])
        let dataRequest: Alamofire.DataRequest
        dataRequest = AF.request(url,
                                 method: method,
                                 parameters: request.parameters,
                                 headers: headers)
        dataRequest.responseData { (response) in
            // 判断请求结果
            switch response.result {
            case .success(let data):
                // parse data
                let parseResult = T.Response.parse(data: data)
                // 判断解析结果
                switch parseResult {
                case .success(let model):
                    handler(.success(model))
                case .failure(let parseError):
                    handler(.failure(parseError))
                }
            case .failure(let afError):
                handler(.failure(afError))
            }
        }
    }
}
