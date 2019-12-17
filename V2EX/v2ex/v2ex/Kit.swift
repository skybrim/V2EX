//
//  Kit.swift
//  v2ex
//
//  Created by wiley on 2019/12/11.
//  Copyright © 2019 wiley. All rights reserved.
//

import UIKit

open class NiblessView: UIView {
    public override init(frame: CGRect) {
        super.init(frame: frame)
    }
    @available(*, unavailable, message: "loading this view from a nib is unsupported")
    public required init?(coder: NSCoder) {
        fatalError("loading this view from a nib is unsupported")
    }
}

extension String {
    /// # 注意性能问题，此下标取值时间复杂度是O(n)
    subscript(index: Int) -> Character {
        guard let stringIndex = self.index(self.startIndex, offsetBy: index, limitedBy: self.endIndex) else {
            fatalError("String index out of range")
        }
        return self[stringIndex]
    }
}

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

extension Sequence where Iterator.Element : Hashable {
    func unique() -> [Iterator.Element] {
        var tmp: Set<Iterator.Element> = []
        return filter {
            if tmp.contains($0) {
                return false
            } else {
                tmp.insert($0)
                return true
            }
        }
    }
}

extension Optional {
    func withExtendedLifetime(_ body: (Wrapped) -> Void) {
        if let `self` = self {
            body(self)
        }
    }
}
