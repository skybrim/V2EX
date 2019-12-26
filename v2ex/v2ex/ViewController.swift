//
//  ViewController.swift
//  v2ex
//
//  Created by wiley on 2019/12/11.
//  Copyright © 2019 wiley. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.view.backgroundColor = UIColor.lightGray
        
        /// https://www.v2ex.com/?tab=all
        let request = V2exRequest<TopicList>()
        AlamofireClient.shared.send(request) { (result) in
            
        }
    }
}

struct V2exRequest<T: HTMLParsable>: HTMLRequestProtocol {
    // https://www.v2ex.com/t/632212#reply49
    var host: String = "https://www.v2ex.com"
    var path: String = "/?tab=all"
//    var path: String = "/t/632212#reply49"
//    var path: String = "/member/Skybrim"
    var method: HTTPMethod = .GET
    var parameters: [String : Any]?
    var headers: [String : String]?
    
    typealias Response = T
    
}


