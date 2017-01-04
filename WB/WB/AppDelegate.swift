//
//  AppDelegate.swift
//  WB
//
//  Created by 浩哲 夏 on 2017/1/3.
//  Copyright © 2017年 浩哲 夏. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = JS_MainViewController()
        window?.makeKeyAndVisible()
        
        
        // Override point for customization after application launch.
        return true
    }

}

