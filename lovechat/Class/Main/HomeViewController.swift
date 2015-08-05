//
//  HomeViewController.swift
//  lovechat
//
//  Created by 王聪 on 15/8/5.
//  Copyright (c) 2015年 旅行派. All rights reserved.
//

import UIKit

class HomeViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let chatVc = ChatListTableViewController()
        self.setupViewController(chatVc, title: "聊天")
        
        let contactVc = ContactListViewController()
        self.setupViewController(contactVc, title: "联系人")
        
        let mineVc = MineViewController()
        self.setupViewController(mineVc, title: "设置")
    }
    
    // MARK: 加载控制器
    func setupViewController(vc: UIViewController, title: String){
        
        let navBarVc = HomeNavViewController(rootViewController: vc)
        
        vc.title = title
        
        self.addChildViewController(navBarVc)
       
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
