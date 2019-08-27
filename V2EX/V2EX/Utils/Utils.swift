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

class Tools {
    
    static func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
        var storeDic = [Int: Int]()
        for (i, num) in nums.enumerated() {
            if let anotherIndex = storeDic[num] {
                return [anotherIndex, i]
            }
            storeDic[target - num] = i
        }
        return []
    }
}
