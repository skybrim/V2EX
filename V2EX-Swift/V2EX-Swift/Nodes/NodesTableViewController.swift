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
        navigationItem.backBarButtonItem = UIBarButtonItem.init(title: "", style: .done, target: nil, action: nil)
    }
    
    //MARK: - UIStoryboardSegue
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
        if segue.identifier == "Show Post List" {
            if let destination = segue.destination as? PostTableViewController,
                let cell = sender as? UITableViewCell {
                destination.theme = cell.textLabel?.text
            }
        } else if segue.identifier == "Show Account Info" {
            
        }
    }

    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return 1
        }
        return nodes.nodesInfo.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            let accountCell = tableView.dequeueReusableCell(withIdentifier: "Account Cell", for: indexPath)
            accountCell.textLabel?.text = NSLocalizedString("accounts", comment: "Accounts")
            return accountCell
        }
        let nodesCell = tableView.dequeueReusableCell(withIdentifier: "Nodes Cell", for: indexPath)
        nodesCell.textLabel?.text = nodes.nodesInfo[indexPath.row]
        return nodesCell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 0 {
            return 64
        }
        return 44
    }
    
    // MARK: -  Table view delegate
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    // MARK: - Restore
    
    override func encodeRestorableState(with coder: NSCoder) {
        super.encodeRestorableState(with: coder)
    }
    
    override func decodeRestorableState(with coder: NSCoder) {
        super.decodeRestorableState(with: coder)
    }
    
    // MARK: - Property
    var nodes = Nodes()
    @IBOutlet var nodesTableView: UITableView! {
        didSet {

        }
    }
}
