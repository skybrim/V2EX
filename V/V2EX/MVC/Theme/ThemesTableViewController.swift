//
//  ThemesTableViewController.swift
//  V2EX-Swift
//
//  Created by Wiley on 2019/6/26.
//  Copyright © 2019 Wiley. All rights reserved.
//

import UIKit
import MJRefresh

class ThemesTableViewController: UITableViewController, UISplitViewControllerDelegate {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.backBarButtonItem = UIBarButtonItem.init(title: "", style: .done, target: nil, action: nil)
    }
    
    //MARK: - UIStoryboardSegue
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
        if segue.identifier == "Show Topic List" {
            if let destination = segue.destination as? TopicListTableViewController,
                let cell = sender as? UITableViewCell,
                let indexPath = tableView.indexPath(for: cell) {
                destination.theme = themes.themeInfo[indexPath.row]
            }
        } else if segue.identifier == "Show Account Info" {
            
        }
    }

    // MARK: - Restore
    
    override func encodeRestorableState(with coder: NSCoder) {
        super.encodeRestorableState(with: coder)
    }
    
    override func decodeRestorableState(with coder: NSCoder) {
        super.decodeRestorableState(with: coder)
    }
    
    // MARK: - Property
    
    var themes = Themes()

}

extension ThemesTableViewController {
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return Themes.Function.all.count
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == Themes.Function.account.rawValue {
            return 0
        } else if section == Themes.Function.theme.rawValue {
            return themes.themeInfo.count
        } else if section == Themes.Function.navigation.rawValue {
            return 0
        }
        return 0
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == Themes.Function.account.rawValue {
            let accountCell = tableView.dequeueReusableCell(withIdentifier: "Account Cell", for: indexPath)
            accountCell.textLabel?.text = NSLocalizedString("user", comment: "user")
            return accountCell
        } else if indexPath.section == Themes.Function.theme.rawValue {
            let nodesCell = tableView.dequeueReusableCell(withIdentifier: "Nodes Cell", for: indexPath)
            nodesCell.textLabel?.text = NSLocalizedString(themes.themeInfo[indexPath.row], comment: themes.themeInfo[indexPath.row])
            return nodesCell
        } else if indexPath.section == Themes.Function.navigation.rawValue {
            let navigationCell = tableView.dequeueReusableCell(withIdentifier: "Navigation Cell", for: indexPath)
            navigationCell.textLabel?.text = NSLocalizedString("planes", comment: "Planes")
            return navigationCell
        }
        return UITableViewCell()
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == Themes.Function.account.rawValue {
            return 64
        }
        return 44
    }
    
    // MARK: -  Table view delegate
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
}
