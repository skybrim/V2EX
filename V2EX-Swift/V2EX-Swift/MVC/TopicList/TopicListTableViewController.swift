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
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.topicList.topics.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let topic = topicList.topics[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "Topic Cell", for: indexPath)
        cell.imageView?.kf.setImage(with: URL(string: topic.avatar == nil ? "url" : "http:" + topic.avatar!), placeholder: UIImage(named: "placeholder"))
        cell.textLabel?.text = topic.topicTitle
        cell.detailTextLabel?.text = topic.topicSubTitle
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }

    //MARK: - Network
    
    /// 根据tab名称，请求数据，并解析html
    ///
    /// - Parameter tab: theme
    private func requestTopicList(tab: String) {
        v2exUrlProvider.request(.topicList(tab: theme)) { (result) in
            switch result {
            case .success(let response):
                let jiDoc = Ji(htmlData: response.data)
                if let topicListRootNode = jiDoc? .xPath("//body/div[@id='Wrapper']/div[@class='content']/div[@id='Main']/div[2]/div[@class='cell item']") {
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
}
