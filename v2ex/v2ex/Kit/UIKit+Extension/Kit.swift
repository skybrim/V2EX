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


