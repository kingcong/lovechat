//
//  ChatListTableViewController.swift
//  lovechat
//
//  Created by 王聪 on 15/8/5.
//  Copyright (c) 2015年 旅行派. All rights reserved.
//

import UIKit
import Alamofire

class ChatListTableViewController: UITableViewController {

//    var dataSource
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let rightBtn = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.Add, target: self, action: "addFriend")
        self.navigationItem.rightBarButtonItem = rightBtn
    }
    
    // MARK: 添加好友
    func addFriend(){
        
        // 使用Alamofire请求网络数据
//        Alamofire.request(.GET, "http://httpbin.org/get")
        
        // 使用PXAlertView弹出视图
        /*
        var alertView = PXAlertView.showAlertWithTitle(nil, message: nil, cancelTitle: "取消", otherTitles: ["添加好友","添加群组"]) { (canceled: Bool, buttonIndex: Int) -> Void in
        }
        */
        
        var alertView = UIAlertView()
        alertView.addButtonWithTitle("取消")
        alertView.addButtonWithTitle("添加群组")
        alertView.addButtonWithTitle("添加好友")
        alertView.cancelButtonIndex=0
    
        alertView.showAlertViewWithBlock { (buttonIndex: Int) -> Void in
            
            if buttonIndex == 1 {
                let searchContact = SearchContactController()
//                let nav = UINavigationController(rootViewController: searchContact)
                self.presentViewController(searchContact, animated: true, completion: { () -> Void in
                    
                })
            } else {
                
            }
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        
        return 0
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 0
    }

}
