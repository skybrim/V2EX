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
        let request = v2exRequest<Temp>()
        AlamofireClient.shared.send(request) { (result) in
            dump(result)
        }
    }
}

struct v2exRequest<T: Parsable & Decodable>: RequestProtocol {
    var host: String = "https://www.v2ex.com"
    var path: String = "/?tab=all"
    var method: HTTPMethod = .GET
    var parameters: [String : Any]?
    var headers: [String : String]?
    
    typealias Response = T
    
}

struct Temp: Parsable, Decodable {
    
}
