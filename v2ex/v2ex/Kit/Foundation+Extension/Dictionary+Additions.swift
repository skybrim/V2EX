//
//  Dictionry+Additions.swift
//  v2ex
//
//  Created by wiley on 2019/12/20.
//  Copyright © 2019 wiley. All rights reserved.
//

import Foundation

extension Dictionary {
    mutating func merge<S: Sequence>(_ sequence: S)
        where S.Iterator.Element == (key: Key, value: Value) {
            sequence.forEach{ self[$0] = $1 }
    }
    init<S: Sequence>(_ sequence: S)
        where S.Iterator.Element == (key: Key, value: Value) {
            self = [:]
            self.merge(sequence)
    }
}
