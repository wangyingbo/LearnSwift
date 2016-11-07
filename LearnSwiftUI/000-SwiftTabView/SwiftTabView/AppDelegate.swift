//
//  AppDelegate.swift
//  SwiftTabView
//
//  Created by 王迎博 on 16/10/8.
//  Copyright © 2016年 王迎博. All rights reserved.
//

import UIKit

@UIApplicationMain

class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        
        let rootVC = HomeVC()
        let rootNavVC = UINavigationController(rootViewController: rootVC)
        self.window?.rootViewController = rootNavVC
        
        UIApplication.sharedApplication().statusBarHidden = false
        
        return true
    }

    func applicationWillResignActive(application: UIApplication) {
    }

    func applicationDidEnterBackground(application: UIApplication) {
    }

    func applicationWillEnterForeground(application: UIApplication) {
    }

    func applicationDidBecomeActive(application: UIApplication) {
    }

    func applicationWillTerminate(application: UIApplication) {
    }


}

