//
//  Optional+Additions.swift
//  v2ex
//
//  Created by wiley on 2019/12/20.
//  Copyright © 2019 wiley. All rights reserved.
//

import Foundation

extension Optional {
    /// # withExtendedLifetime(x: <T>, body: () throws -> Result)
    /// 第一个参数是它要“延长寿命”的对象；
    /// 第二个参数是一个closure，在这个closure返回之前，第一个参数会一直“存活”在内存里
    func withExtendedLifetime(_ body: (Wrapped) -> Void) {
        if let `self` = self {
            body(self)
        }
    }
}
