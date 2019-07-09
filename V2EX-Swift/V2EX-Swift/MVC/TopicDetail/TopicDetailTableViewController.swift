//
//  PostDetailTableViewController.swift
//  V2EX-Swift
//
//  Created by Wiley on 2019/6/27.
//  Copyright © 2019 Wiley. All rights reserved.
//

import UIKit

class TopicDetailTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 20
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Topic Reply Cell", for: indexPath)
        cell.textLabel?.text = String(indexPath.row)
        return cell
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
    
    /// 获取主题信息
    private func requestTopicDetail() {
        v2exApiProvider.request(.topicsShow(id: topicID!)) { (result) in
            switch result {
            case .success(let response):
                self.topicDetails = try? JSONDecoder().decode([TopicDetail].self, from: response.data)
            case .failure(let error):
                print(error)
            }
        }
    }
    
    private func requestReplies() {
        v2exApiProvider.request(.repliesShow(topic_id: topicID!, page: 0, page_size: 20)) { (result) in
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
            requestTopicDetail()
            requestReplies()
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
                self?.topicDetailView.titleLabel.text = self?.topicDetails?.first?.title

                
                
                self?.topicDetailView.setNeedsLayout()
                self?.topicDetailView.layoutIfNeeded()
                self?.topicDetailTableView.tableHeaderView = self?.topicDetailView
            }
        }
    }
    
    var replies: [Reply]? {
        didSet {
            
        }
    }
    
    var topicDetailView = TopicDetailView()
    
    @IBOutlet var topicDetailTableView: UITableView! {
        didSet {
            topicDetailTableView.register(TopicReplyTableViewCell.self, forCellReuseIdentifier: "Topic Reply Cell")
            topicDetailTableView.tableHeaderView = topicDetailView
            topicDetailTableView.tableFooterView = UIView()
        }
    }
}
