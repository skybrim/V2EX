//
//  PostTableViewController.swift
//  V2EX-Swift
//
//  Created by wiley on 2019/6/26.
//  Copyright © 2019 Wiley. All rights reserved.
//

import UIKit
import Moya
import Kingfisher

class TopicListTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return self.topicList.topics.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let topic = topicList.topics[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "Topic Cell", for: indexPath)
        cell.imageView!.kf.setImage(with: URL(string: topic.avatar == nil ? "url" : "http:" + topic.avatar!), placeholder: UIImage(named: "placeholder"))
        cell.textLabel?.text = topic.topicTitle
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    //MARK: - Network
    
    /// 根据tab名称，请求数据。解析html
    ///
    /// - Parameter tab: theme
    private func requestTopicList(tab: String) {
        v2exUrlProvider.request(.topicList(tab: theme)) { (result) in
            switch result {
            case .success(let response):
                let jiDoc = Ji(htmlData: response.data)
                if let topicListRootNode = jiDoc? .xPath("//body/div[@id='Wrapper']/div[@class='content']/div[@id='Main']/div[@class='box']/div[@class='cell item']") {
                    for topicNode in topicListRootNode {
                        let topic = Topic(topicNode)
                        self.topicList.topics.append(topic)
                    }
                }
                self.tableView.reloadData()
            case .failure(let error):
                print(error)
            }
        }
    }
    
    // MARK: - Restore
    
    override func encodeRestorableState(with coder: NSCoder) {
        super.encodeRestorableState(with: coder)
        coder.encode(theme, forKey: "kPostTheme")
    }
    
    override func decodeRestorableState(with coder: NSCoder) {
        super.decodeRestorableState(with: coder)
        if let theme = coder.decodeObject(forKey: "kPostTheme") as? String{
            self.theme = theme
        }
    }
    
    // MARK: - property
    
    var theme: String? {
        didSet {
            title = NSLocalizedString(theme!, comment: theme!)
            requestTopicList(tab: theme!)
        }
    }
    
    var topicList = TopicList()
    
    @IBOutlet var topicListTableView: UITableView! {
        didSet {
//            topicListTableView.register(TopicListTableViewCell.self, forCellReuseIdentifier: "Topic Cell")
//            topicListTableView.rowHeight = UITableView.automaticDimension
//            topicListTableView.estimatedRowHeight = 70
        }
    }
}
