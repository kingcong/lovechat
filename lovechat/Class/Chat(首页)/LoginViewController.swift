//
//  LoginViewController.swift
//  lovechat
//
//  Created by 王聪 on 8/5/15.
//  Copyright (c) 2015 旅行派. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: NSBundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        //println(nibName);
    }
    convenience init() {
        var nibNameOrNil = String?("LoginViewController")
        
        //考虑到xib文件可能不存在或被删，故加入判断
//        if NSBundle.mainBundle().pathForResource(nibNameOrNil, ofType: "xib") == nil{   nibNameOrNil = nil}
        
        self.init(nibName: nibNameOrNil, bundle: nil)
    }
    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
