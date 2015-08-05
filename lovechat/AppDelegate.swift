//
//  AppDelegate.swift
//  lovechat
//
//  Created by 王聪 on 8/4/15.
//  Copyright (c) 2015 旅行派. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    
    var ease: EaseMob = EaseMob.sharedInstance()

    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        
        var AppKey = "kingcong#lovechat"
        ease.registerSDKWithAppKey(AppKey, apnsCertName: nil)
        ease.application(application, didFinishLaunchingWithOptions: launchOptions)
        
        self.window = UIWindow(frame: UIScreen.mainScreen().bounds)
        
        self.window?.makeKeyAndVisible()
        
        // 登录控制器
        let loginVc = LoginViewController()
        
        // tabBar控制器
        let homeTabVc = HomeViewController()
        
        // 设置window的根控制器
        self.setRootVc(loginVc: loginVc, homeTabVc: homeTabVc)
        
        return true
    }
    
    // MARK: 设置根控制器
    func setRootVc(#loginVc: LoginViewController, homeTabVc: HomeViewController){
        let defaults = NSUserDefaults.standardUserDefaults()
        var isLoginSuccess = defaults .boolForKey(ISLOGINSUCCESS)
        if isLoginSuccess {
            self.window?.rootViewController = homeTabVc
        }else{
            self.window?.rootViewController = loginVc
        }
    }

    func applicationWillResignActive(application: UIApplication) {
    }

    func applicationDidEnterBackground(application: UIApplication) {
        
        ease.applicationDidEnterBackground(application)
    }

    func applicationWillEnterForeground(application: UIApplication) {
        
        ease.applicationWillEnterForeground(application)
    }

    func applicationDidBecomeActive(application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(application: UIApplication) {
        ease.applicationWillTerminate(application)
    }


}

