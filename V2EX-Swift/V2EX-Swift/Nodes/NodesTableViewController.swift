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
    
    //MARK: -
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "Show Post List" {
            if let destination = segue.destination as? PostTableViewController,
                let cell = sender as? UITableViewCell {
                destination.theme = cell.textLabel?.text
            }
        }
    }

    // MARK: - Table view data source delegate
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Nodes.nodes.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Nodes Cell", for: indexPath)
        cell.textLabel?.text = Nodes.nodes[indexPath.row]
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
