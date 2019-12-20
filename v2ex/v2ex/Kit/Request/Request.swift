//
//  Request.swift
//  v2ex
//
//  Created by wiley on 2019/12/20.
//  Copyright © 2019 wiley. All rights reserved.
//

import Foundation
import Alamofire

// MARK: - request
/// # HTTP 方法枚举
enum HTTPMethod: String {
    case GET // 获取资源
    case POST // 传输实体主体
    case HEAD // 获得报文头部
    case PUT // 传输文件，不带验证
    case DELETE // 删除文件，不带验证
}

/// # 发起请求遵循 Request 协议
protocol Request {
    // 关联类型
    associatedtype Response: Decodable, Parsable
    
    var host: String { get }
    var path: String { get }
    
    var method: HTTPMethod { get }
    var parameters: [String: Any]? { get }
    var headers: [String: String]? { get }
}

// MARK: - Parse
protocol Parsable {
    static func parse(data: Data) -> Result<Self, Error>
}

/// # Array 条件遵循
/// 当Array里的元素遵循Parsable以及Decodable时，Array也遵循Parsable协议
extension Array: Parsable where Array.Element: (Parsable & Decodable) {}

/// 同时遵循 Decodable 和 Parsable ，扩展方法
extension Parsable where Self: Decodable {
    static func parse(data: Data) -> Result<Self, Error> {
        do {
            let model = try JSONDecoder().decode(Self.self, from: data)
            return .success(model)
        } catch {
            return .failure(error)
        }
    }
}

// MARK: - Client
protocol Client {
    func send<T: Request>(_ r: T, handler: @escaping (Result<T.Response, Error>) -> Void)
//    func download()
}

/// # 使用 Alamofire 发起请求
struct AlamofireClient: Client {
    /// # Singleton
    static let shared = AlamofireClient()
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

