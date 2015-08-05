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
        
        let loginVc = LoginViewController()
        
        self.window?.rootViewController = loginVc
        
        return true
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

