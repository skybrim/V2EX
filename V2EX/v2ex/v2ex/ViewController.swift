//
//  ViewController.swift
//  v2ex
//
//  Created by wiley on 2019/12/11.
//  Copyright © 2019 wiley. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.view.backgroundColor = UIColor.lightGray

        
        
        var string: String = "123"
        string.insert(contentsOf: "aaa", at: string.startIndex)
        print(string[2])
        
        var array = [1, 2, 3]
        array = array.map() { $0 * $0 }
        
    
        if case ("1", "2") = ("1", "2") {
            print("correct")
        }
        
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
