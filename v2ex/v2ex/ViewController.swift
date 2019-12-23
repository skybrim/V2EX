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
        // https://jsonplaceholder.typicode.com/posts
        
        let tempRequet = V2exRequest([Temp].self, path: "/posts")
        
        
        
        AlamofireSession.shared.send(tempRequet) { (result) in
            switch result {
            case .success(let model):
                dump(model)
            case .failure(let error):
                print("\(error)")
            }
        }
        
        
        
    }
}


enum V2exPath: String {
    case user = "/user"
}

struct V2exRequest<T: Parsable & Codable>: Request {
    var host: String = "https://jsonplaceholder.typicode.com"
    var path: String
    var method: HTTPMethod
    var parameters: [String: Any]?
    var headers: [String: String]?
    typealias Response = T
    
    init(_ responseType: Response.Type,
         path: String,
         method: HTTPMethod = .GET,
         parameters: [String: Any]? = nil,
         headers: [String: String]? = nil) {
        self.path = path
        self.method = method
        self.parameters = parameters
        self.headers = headers
    }
}

struct Temp: Codable, Parsable {
    var userId: Float
    var id: Float
    var title: String
    var body: String
}
