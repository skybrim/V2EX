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
import MJRefresh

class TopicListTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.backBarButtonItem = UIBarButtonItem.init(title: "", style: .done, target: nil, action: nil)
    }

    //MARK: - UIStoryboardSegue
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
        if segue.identifier == "Show Topic Detail" {
            if let destination = segue.destination as? TopicDetailTableViewController,
                let cell = sender as? UITableViewCell,
                let indexPath = tableView.indexPath(for: cell) {
                let topic = topicList.topics[indexPath.row]
                destination.topicID = topic.topicID
            }
        }
    }
    
    //MARK: - private
    private func updateUI() {
        self.tableView.reloadData()
        self.tableView.mj_header.endRefreshing()
    }

    //MARK: - Network
    
    /// 根据tab名称，请求数据，并解析html
    ///
    /// - Parameter tab: theme
    @objc private func requestTopicList() {
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
                self.updateUI()
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
        }
    }
    
    var topicList = TopicList()
    
    @IBOutlet var topicListTableView: UITableView! {
        didSet {
            //注册cell
            topicListTableView.register(TopicListTableViewCell.self, forCellReuseIdentifier: "Topic List Cell")
            //下拉刷新
            let header = MJRefreshNormalHeader()
            header.setRefreshingTarget(self, refreshingAction: #selector(self.requestTopicList))
            topicListTableView.mj_header = header
            topicListTableView.mj_header.beginRefreshing()
            //分割线全屏的方法，还有一部分在cell里面
            //1.调整(iOS7以上)表格分隔线边距
            if topicListTableView.responds(to: #selector(setter: UITableView.separatorInset)) {
                topicListTableView.separatorInset = UIEdgeInsets.zero
            }
        }
    }
}

extension TopicListTableViewController {
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.topicList.topics.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Topic List Cell", for: indexPath)
        if let topicCell = cell as? TopicListTableViewCell {
            let topic = topicList.topics[indexPath.row]
            topicCell.avatarImageView.kf.setImage(with: topic.avatarUrl, placeholder: UIImage(named: "placeholder"))
            topicCell.userLabel.text = topic.userName
            topicCell.detailLabel.text = topic.topicDetail
            topicCell.nodeLabel.text = topic.nodeName
            topicCell.titleLabel.text = topic.topicTitle
        }
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "Show Topic Detail", sender: tableView.cellForRow(at: indexPath))
    }
}
