//
//  TodayViewController.swift
//  V2EX-Hot
//
//  Created by Wiley on 2019/7/10.
//  Copyright © 2019 Wiley. All rights reserved.
//

import UIKit
import NotificationCenter
import Kingfisher

class TodayViewController: UIViewController, NCWidgetProviding, UITableViewDelegate, UITableViewDataSource {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        extensionContext?.widgetLargestAvailableDisplayMode = NCWidgetDisplayMode.expanded
        requestHot()
    }
    
    //MARK: - NCWidgetProviding
    
    func widgetActiveDisplayModeDidChange(_ activeDisplayMode: NCWidgetDisplayMode, withMaximumSize maxSize: CGSize) {
        if activeDisplayMode == .compact {
            //折叠
            preferredContentSize = CGSize(width: maxSize.width, height: 110)
        } else {
            //展开
            preferredContentSize = CGSize(width: maxSize.width, height: CGFloat(44 * (hotTopics?.count ?? 10)))
        }
    }
    
    func widgetPerformUpdate(completionHandler: (@escaping (NCUpdateResult) -> Void)) {
        // Perform any setup necessary in order to update the view.
        
        // If an error is encountered, use NCUpdateResult.Failed
        // If there's no update required, use NCUpdateResult.NoData
        // If there's an update, use NCUpdateResult.NewData
        
        completionHandler(NCUpdateResult.newData)
    }
    
    //MARK: - UITableView DataSource Delegate
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return hotTopics?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Hot Topic Cell", for: indexPath)
        if let hotTopic = hotTopics?[indexPath.row] {
            cell.textLabel?.text = hotTopic.title
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
    
    //MARK: - Network
    
    func requestHot() {
        v2exHotApiProvider.request(.topicsHot) { (result) in
            switch result {
            case .success(let response):
                self.hotTopics = try? JSONDecoder().decode([HotTopic].self, from: response.data)
            case .failure(let error):
                print(error)
            }
        }
    }
    
    //MARK: - property
    
    var hotTopics: [HotTopic]? {
        didSet {
            hotTopicListTableView.reloadData()
        }
    }
    
    @IBOutlet weak var hotTopicListTableView: UITableView!
}
