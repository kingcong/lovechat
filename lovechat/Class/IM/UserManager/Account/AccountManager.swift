//
//  AccountManager.swift
//  lovechat
//
//  Created by 王聪 on 8/5/15.
//  Copyright (c) 2015 旅行派. All rights reserved.
//

import UIKit

let accountManager = AccountManager()

class AccountManager: NSObject {
    
    // 初始化
    class func shareInstance() -> AccountManager {
        return accountManager
    }
}
