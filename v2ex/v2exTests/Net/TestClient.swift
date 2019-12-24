//
//  TestSession.swift
//  v2exTests
//
//  Created by wiley on 2019/12/23.
//  Copyright © 2019 wiley. All rights reserved.
//

import Foundation
@testable import v2ex

struct TestClient: Client {
    static let shared = TestClient()
    private init() {}
    
    /// # 发送请求
    func send<T: RequestProtocol>(_ request: T, handler: @escaping (Result<T.Response, Error>) -> Void) {
        switch request.path {
        case "/Net/TestJSON":
            guard let fileURL = Bundle(for: V2exSessionTest.self).url(forResource: "TestJSON", withExtension: "") else {
                fatalError("JSON not found.")
            }
            guard let data = try? Data(contentsOf: fileURL) else {
                fatalError("JSON not found.")
            }
            let parseResult = T.Response.parse(data: data)
            switch parseResult {
            case .success(let model):
                handler(.success(model))
            case .failure(let parseError):
                handler(.failure(parseError))
            }
        default:
            fatalError("JSON not found.")
        }
    }
}
