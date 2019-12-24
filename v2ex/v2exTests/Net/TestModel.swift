//
//  TestModel.swift
//  v2exTests
//
//  Created by wiley on 2019/12/23.
//  Copyright © 2019 wiley. All rights reserved.
//

import Foundation
@testable import v2ex

struct TestModel: Codable, Parsable, Equatable {
    var userId: Float
    var id: Float
    var title: String
    var body: String
    
    static func == (lhs: TestModel, rhs: TestModel) -> Bool {
        return lhs.userId == rhs.userId &&
            lhs.id == rhs.id &&
            lhs.title == rhs.title &&
            lhs.body == rhs.body
    }

}
