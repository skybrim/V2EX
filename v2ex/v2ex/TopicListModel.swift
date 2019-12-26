//
//  TopicListModel.swift
//  v2ex
//
//  Created by wiley on 2019/12/26.
//  Copyright © 2019 wiley. All rights reserved.
//

import Foundation
import Ono

struct TopicList: HTMLParsable {
    static func HTMLParse(data: Data) throws -> TopicList {
        var array = [Topic]()
        let document: ONOXMLDocument
        
        // 解析
        do {
            document = try ONOXMLDocument(data: data)
        } catch  {
            throw error
        }
        
        // tabs
//        let tabsElement = document.firstChild(withXPath: "//div[@class='inner'][@id='Tabs']")
        
        // SecondaryTabs
//        let SecondaryTabsElement = document.firstChild(withXPath: "//div[@class='cell'][@id='SecondaryTabs']")
        
        // topic list
        
        document.enumerateElements(
        withXPath: "//div[@id='Main']/div[@class='box']") { (element, index, _) in
            print("---------------\(index)")
            let avatar = element.firstChild(withXPath: "//img[@class='avatar']")?
                .attributes["src"] as? String ?? "avatar_null"
            let title = element.firstChild(withXPath: "//span[@class='item_title']")?
                .stringValue ?? "title_null"
            let link = element.firstChild(withXPath: "//a[@class='topic-link']")?
                .attributes["href"] as? String ?? "link_null"
            let node = element.firstChild(withXPath: "//a[@class='node']")?
                .stringValue ?? "node_null"
                       
            let topic = Topic(avatar: avatar, link: link, title: title, node: node)
            array.append(topic)
        }
        dump(array)
        return TopicList(topics: array)
    }
    
    static let empty = TopicList()
    
    var topics: [Topic] = []
    
    struct Topic {
        var avatar: String
        var link: String
        var title: String
        var node: String

    }
}


/*
 
 //body/div[@id='Wrapper']/div[@class='content']/div[@id='Main']/div[@class='box']/div[@class='cell item']
 
 */
