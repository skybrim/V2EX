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
