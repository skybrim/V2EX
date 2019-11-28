//
//  Utils.swift
//  V2EX-Swift
//
//  Created by Wiley on 2019/7/4.
//  Copyright © 2019 Wiley. All rights reserved.
//

import Foundation

extension String {
    /// 获取 urlString 中的参数
    ///
    /// - Returns: 参数字典
    func urlQuery() -> [String: String] {
        var params = [String:String]()
        guard let queryItems = URLComponents(string: self)?.queryItems else { return params }
        for item in queryItems {
            params[item.name] = item.value
        }
        return params
    }
}

