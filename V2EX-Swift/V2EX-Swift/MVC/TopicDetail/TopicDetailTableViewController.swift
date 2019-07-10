//
//  PostDetailTableViewController.swift
//  V2EX-Swift
//
//  Created by Wiley on 2019/6/27.
//  Copyright © 2019 Wiley. All rights reserved.
//

import UIKit
import MJRefresh

class TopicDetailTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return replies?.count ?? 0
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Topic Reply Cell", for: indexPath)
        if let replyCell = cell as? TopicReplyTableViewCell,
            let reply = replies?[indexPath.row] {
            replyCell.avatarImageView.kf.setImage(with: reply.member?.avatarUrl, placeholder: UIImage(named: "placeholder"))
            replyCell.userLabel.text = reply.member?.username
            replyCell.tagLabel.isHidden = reply.member?.id != topicDetails?.first?.member?.id
            replyCell.timeLabel.text = reply.createdFormat
            replyCell.contentLabel.text = reply.content
        }
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 1
    }

    //MARK: - Network
    
    /// 获取主题信息
    private func requestTopicDetail(completion: @escaping () -> ()) {
        v2exApiProvider.request(.topicsShow(id: topicID!)) { (result) in
            switch result {
            case .success(let response):
                self.topicDetails = try? JSONDecoder().decode([TopicDetail].self, from: response.data)
                completion()
            case .failure(let error):
                print(error)
            }
        }
    }
    
    var completionHandlers: [() -> Void] = []

    
    @objc private func requestReplies() {
        v2exApiProvider.request(.repliesShow(topic_id: topicID!)) { (result) in
            switch result {
            case .success(let response):
                self.replies = try? JSONDecoder().decode([Reply].self, from: response.data)
            case .failure(let error):
                print(error)
            }
        }
    }
    
    //MARK: - property
    
    var topicID: String? {
        didSet {
            requestTopicDetail { [weak self] in
                self?.requestReplies()
            }
        }
    }
    
    var topicDetails: [TopicDetail]? {
        didSet {
            //加载 markdown
            topicDetailView.mdView.load(markdown: self.topicDetails?.first?.content)
            topicDetailView.mdView.onRendered = { [weak self] height in
                self?.topicDetailView.mdView.snp.makeConstraints ({ (make) in
                    make.height.equalTo(height).priority(.high)
                })
                //顶部的 topicDetailView 的其他布局放在这里，和 markdown 同时加载显示出来
                self?.topicDetailView.avatarImageView.kf.setImage(with: self?.topicDetails?.first?.member?.avatarUrl, placeholder: UIImage(named: "placeholder"))
                self?.topicDetailView.userLabel.text = self?.topicDetails?.first?.member?.username
                self?.topicDetailView.timeLabel.text = self?.topicDetails?.first?.createdFormat
                self?.topicDetailView.titleLabel.text = self?.topicDetails?.first?.title
                //刷新布局
                self?.topicDetailView.setNeedsLayout()
                self?.topicDetailView.layoutIfNeeded()
                self?.topicDetailTableView.tableHeaderView = self?.topicDetailView
            }
        }
    }
    
    var replies: [Reply]? {
        didSet {
            topicDetailTableView.reloadData()
        }
    }
    
    var topicDetailView = TopicDetailView()
    
    @IBOutlet var topicDetailTableView: UITableView! {
        didSet {
            topicDetailTableView.register(TopicReplyTableViewCell.self, forCellReuseIdentifier: "Topic Reply Cell")
            topicDetailTableView.tableHeaderView = topicDetailView
            topicDetailTableView.tableFooterView = UIView()
            //分割线全屏的方法，还有一部分在cell里面
            //1.调整(iOS7以上)表格分隔线边距
            if topicDetailTableView.responds(to: #selector(setter: UITableView.separatorInset)) {
                topicDetailTableView.separatorInset = UIEdgeInsets.zero
            }
        }
    }
}
