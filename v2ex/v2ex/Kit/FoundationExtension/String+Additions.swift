//
//  String+Additions.swift
//  v2ex
//
//  Created by wiley on 2019/12/20.
//  Copyright © 2019 wiley. All rights reserved.
//

import Foundation

extension String {
    /// # 注意性能问题，此下标取值时间复杂度是O(n)
    subscript(index: Int) -> Character {
        guard let stringIndex = self.index(self.startIndex, offsetBy: index, limitedBy: self.endIndex) else {
            fatalError("String index out of range")
        }
        return self[stringIndex]
    }
}
