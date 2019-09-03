//
//  QuickTests.swift
//  V2EXTests
//
//  Created by wiley on 2019/9/3.
//  Copyright © 2019 wiley. All rights reserved.
//

import Quick
import Nimble

@testable import V2EX

class ThemesTests: QuickSpec {
    override func spec() {
        var subject: ThemesTableViewController!
        //describe闭包开始第一个测试案例，为ThemesTableViewController编写测试
        describe("ThemesTableViewController") {
            //beforeEach会在describe中执行，它将在每个范例开始之前运行
            //所以在ThemesTableViewController内的每一个测试被执行前，会先运行这段代码。
            beforeEach {
                subject = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "Nodes View Controller") as? ThemesTableViewController
                //将视图控制器放入内存中，它就像是调用viewDidLoad
                _ = subject.view
            }
            
            context("主节点页面加载完成") {
                it("加载12个主题") {
                    expect(subject.tableView.numberOfRows(inSection: Themes.Function.theme.rawValue)).to(equal(12))
                }
            }
            
            context("Themes Table View") {
                var nodesCell: UITableViewCell!
                
                beforeEach {
                    nodesCell = subject.tableView(subject.tableView, cellForRowAt: IndexPath(row: 0, section: Themes.Function.theme.rawValue))
                }
                
                it("themes is tech") {
                    expect(nodesCell.textLabel?.text).to(equal("tech"))
                }
            }
        }
    }
}
