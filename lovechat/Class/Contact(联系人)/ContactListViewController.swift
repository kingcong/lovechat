//
//  ContactListViewController.swift
//  lovechat
//
//  Created by 王聪 on 15/8/5.
//  Copyright (c) 2015年 旅行派. All rights reserved.
//

import UIKit

class ContactListViewController: UIViewController, UITableViewDataSource,UITableViewDelegate{

    var dataSource = [EMBuddy]()
    
    var tableView = UITableView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.reloadDataSource()
        
        self.tableView.dataSource = self
        self.tableView.delegate = self
        self.tableView.frame = self.view.bounds
        self.view.addSubview(self.tableView)
        
    }
    
    func reloadDataSource(){
        
        // 移除数据
        self.dataSource.removeAll(keepCapacity: true)
        
        // 异步获取好友列表
        ease.chatManager.asyncFetchBuddyListWithCompletion({ (buddyList, error: EMError!) -> Void in
            if !(error != nil) {
                println("获取成功\(buddyList.first)")
                
                // var buddy = buddyList[0] as! EMBuddy
                for buddy: EMBuddy in buddyList as! Array{
                    println("\(buddy.username)")
                    self.dataSource.append(buddy)
                }
                
                self.tableView.reloadData()
            }
            }, onQueue: nil)
        
        println("\(self.dataSource)")
        

    }
    
    // MARK: 实现数据源方法
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.dataSource.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        var cell = UITableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: nil)
        let buddy = self.dataSource[indexPath.row]
        cell.textLabel?.text = buddy.username
        
        return cell
    }
    
    // MARK: 实现tableView的代理方法
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
    }

}
