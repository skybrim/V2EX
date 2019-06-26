//
//  NodesTableViewController.swift
//  V2EX-Swift
//
//  Created by Wiley on 2019/6/26.
//  Copyright © 2019 Wiley. All rights reserved.
//

import UIKit

class NodesTableViewController: UITableViewController, UISplitViewControllerDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    // MARK: - Table view data source delegate
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        print(indexPath)
    }
}
