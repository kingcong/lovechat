//
//  ContactListViewController.swift
//  lovechat
//
//  Created by 王聪 on 15/8/5.
//  Copyright (c) 2015年 旅行派. All rights reserved.
//

import UIKit

class ContactListViewController: UITableViewController {

    lazy var dataSource = [EMBuddy]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.reloadDataSource()
    }
    
    func reloadDataSource(){
        
        self.dataSource.removeAll(keepCapacity: true)
        
        var buddyList: Array = ease.chatManager.buddyList
        var blockList: Array = ease.chatManager.blockedList
        
        for buddy: EMBuddy in buddyList {
//            if blockList
        }
    }

}
