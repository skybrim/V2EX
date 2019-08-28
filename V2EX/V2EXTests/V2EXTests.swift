//
//  V2EXTests.swift
//  V2EXTests
//
//  Created by wiley on 2019/8/27.
//  Copyright © 2019 wiley. All rights reserved.
//

import XCTest
@testable import V2EX
@testable import Moya

class V2EXTests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func test_getUrlParameters() {
        let url = "https://www.skybrim.top?key=value"
        let isSuccess = (url.urlQuery() == ["key": "value"])
        XCTAssert(isSuccess, "未能获取 url 的参数字典")
    }

    func test_measure() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
            let _ = Tools.twoSum([1,2,3,4,5,6], 3)
        }
    }
    
    func test_async() {
        let expect = XCTestExpectation(description: "siteInfo")
        v2exApiProvider.request(.siteInfo) { (result) in
            switch result {
            case let .success(moyaResponse):
                XCTAssertTrue(moyaResponse.statusCode == 200)
                expect.fulfill()
            case .failure(_):
                XCTAssert(false, "网络异常")
            }
        }
        let result = XCTWaiter.wait(for: [expect], timeout: 5)
        XCTAssertEqual(result, .completed)
    }
}
