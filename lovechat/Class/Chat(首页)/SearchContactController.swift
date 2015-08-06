//
//  SearchContactController.swift
//  lovechat
//
//  Created by 王聪 on 15/8/5.
//  Copyright (c) 2015年 旅行派. All rights reserved.
//

import UIKit

class SearchContactController: UIViewController,UITableViewDataSource,UITableViewDelegate, UISearchBarDelegate {
    
    lazy var dataSource = [String]()
    
    @IBOutlet weak var searchBar: UISearchBar!
    
    @IBOutlet weak var tableView: UITableView!
    
    @IBAction func back(sender: AnyObject) {
        
        // 返回
        self.dismissViewControllerAnimated(true, completion: { () -> Void in
            
        })
    }
    
    @IBAction func search(sender: AnyObject) {
        
        if !searchBar.text.isEmpty {
            self.dataSource.append(searchBar.text)
            self.tableView.hidden = false
            self.tableView.reloadData()
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        self.tableView.hidden = true
    }
    
    
    // MARK: 实现tableView的数据源方法
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.dataSource.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        var cell = UITableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: nil)
        cell.textLabel?.text = self.dataSource[indexPath.row]
        
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        
        let hud = MBProgressHUD.showHUDAddedTo(self.tableView, animated: true)
        hud.labelText = "正在加载中...."
        
        // 选中某一个cell时发送添加好友请求
        var error: EMError?
        var isSuccess: Bool = ease.chatManager.addBuddy(self.dataSource[indexPath.row], message: "我想添加你为好友", error: &error)
        if (error != nil) {
            println("失败\(error)")
        } else {
            println("成功")
        }
    }
    
    // MARK: 实现searchBar的代理方法
    func searchBarSearchButtonClicked(searchBar: UISearchBar) {
        
        if !searchBar.text.isEmpty {
            self.dataSource.append(searchBar.text)
            self.tableView.hidden = false
            self.tableView.reloadData()
        }
    }
    
    func searchBarShouldBeginEditing(searchBar: UISearchBar) -> Bool {
        
        println("哈哈")
        return true
    }
    
    
    // MARK: 下面的方法是将登录控制器与xib绑定
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: NSBundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }
    convenience init() {
        var nibNameOrNil = String?("SearchContactController")
        
        self.init(nibName: nibNameOrNil, bundle: nil)
    }
    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: 重写父类方法
    override func touchesBegan(touches: Set<NSObject>, withEvent event: UIEvent) {
        super.touchesBegan(touches, withEvent: event)
        
        // 隐藏键盘
        self.view.endEditing(true)
    }
    
}
