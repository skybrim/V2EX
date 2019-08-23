//
//  V2EX_SwiftTests.swift
//  V2EX-SwiftTests
//
//  Created by wiley on 2019/8/23.
//  Copyright © 2019 Wiley. All rights reserved.
//

import XCTest
import Ji

class V2EX_SwiftTests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}

extension V2EX_SwiftTests {
    
    func testModel_TopicList() {
        
        let jiDoc = Ji(htmlData: response.data)
        if let topicListRootNode = jiDoc? .xPath("//body/div[@id='Wrapper']/div[@class='content']/div[@id='Main']/div[2]/div[@class='cell item']") {
            for topicNode in topicListRootNode {
                let topic = Topic(topicNode)
                self.topicList.topics.append(topic)
            }
        }
    }
}
