//
//  TestModel.swift
//  v2exTests
//
//  Created by wiley on 2019/12/23.
//  Copyright © 2019 wiley. All rights reserved.
//

import Foundation
@testable import v2ex

struct TestModel: Codable, Parsable {
    var userId: Float
    var id: Float
    var title: String
    var body: String
}
