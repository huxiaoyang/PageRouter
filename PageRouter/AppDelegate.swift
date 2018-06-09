//
//  AppDelegate.swift
//  PageRouter
//
//  Created by ucredit-XiaoYang on 2017/12/6.
//  Copyright © 2017年 xiaoyang. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        
        window = UIWindow.init(frame: UIScreen.main.bounds)
        window?.backgroundColor = UIColor.white
        
        let nav = UINavigationController.init(rootViewController: ViewController())
        window?.rootViewController = nav
        window?.makeKeyAndVisible()
        
        
        return true
    }

    
    /// 在safair浏览器中输入『PageRouter://AAAViewController』
    /// 进入页面点击『close』，观察控制台打印的回调数据
    
    func application(_ app: UIApplication, open url: URL, options: [UIApplication.OpenURLOptionsKey : Any] = [:]) -> Bool {
        
        let host = url.host
        guard let enumValue = host else {
            return false
        }
        
        let type = Router(rawValue: enumValue)
        
        guard let who = type  else {
            return false
        }
        
        Page.jump(to: who) { reslut in
            print("callback ------->  \(reslut)")
        }
        
        return true
    }
    
}

