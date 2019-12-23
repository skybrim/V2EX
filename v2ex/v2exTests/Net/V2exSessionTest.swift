//
//  V2exSessionTest.swift
//  v2exTests
//
//  Created by wiley on 2019/12/23.
//  Copyright © 2019 wiley. All rights reserved.
//

import XCTest

class V2exSessionTest: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func test_session() {
        let request = TestRequest(TestModel.self, path: "/Net/TestJSON")
        TestSession.shared.send(request) { (result) in
//            switch result
//            case .success()
        }
    }
}
