//
//  LoginViewController.swift
//  lovechat
//
//  Created by 王聪 on 8/5/15.
//  Copyright (c) 2015 旅行派. All rights reserved.
//

import UIKit

let ease = EaseMob.sharedInstance()

class LoginViewController: UIViewController {
    
    @IBOutlet weak var userName: UITextField!
    
    @IBOutlet weak var passWord: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    
    // MARK: 登录注册点击事件
    @IBAction func login(sender: AnyObject)
    {
        if self.userName.text.isEmpty || self.passWord.text.isEmpty{
            println("用户名或密码为空")
            return
        }
        println("正在登录")
        
        // 登录方法
        ease.chatManager.asyncLoginWithUsername(self.userName.text, password: self.passWord.text, completion: { (loginInfo, error: EMError!) -> Void in
            if (!(error != nil)&&loginInfo != nil) {
                println(loginInfo)
                
                // 存储登录状态
                var defaults = NSUserDefaults.standardUserDefaults()
                defaults.setBool(true, forKey: ISLOGINSUCCESS)
                defaults.synchronize()
                
            }else{
                println("信息\(loginInfo)")
            }
        
        }, onQueue: nil)
    }
    
    @IBAction func register(sender: AnyObject) {
        // 注册方法
        ease.chatManager.asyncRegisterNewAccount("wangcong", password: "123456", withCompletion: { (userName:String!, password: String!, error: EMError!) -> Void in
            if !(error != nil) {
                println("注册成功")
            }
            }, onQueue: nil)
    }

    // MARK: 下面的方法是将登录控制器与xib绑定
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: NSBundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }
    convenience init() {
        var nibNameOrNil = String?("LoginViewController")
        
        self.init(nibName: nibNameOrNil, bundle: nil)
    }
    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    

}
