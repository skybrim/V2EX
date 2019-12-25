//
//  Parsable.swift
//  v2ex
//
//  Created by wiley on 2019/12/23.
//  Copyright © 2019 wiley. All rights reserved.
//

import Foundation
import Ono

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

//extension Parsable where Self: ONOSearching {
//    static func parse(data: Data) -> Result<Self, Error> {
//        do {
//            let document = try ONOXMLDocument(data: data)
////            document.rootElement.tag
//
//            for element in document.rootElement.children.first?.children ?? [] {
//                let nutrient = element.tag
//                let amount = element.numberValue!
//                let unit = element.attributes["units"]!
//
//                print("- \(amount)\(unit) \(nutrient)")
//            }
//
//            document.enumerateElements(withXPath: "//food/name") { (element, _, _) in
//                print(element)
//            }
//
//            document.enumerateElements(withCSS: "food > serving[units]") { (element, _, _) in
//                print(element)
//            }
//            return .success(document)
//        } catch {
//            return .failure(error)
//        }
//    }
//}
