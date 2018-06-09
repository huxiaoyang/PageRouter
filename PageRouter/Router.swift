//
//  Router.swift
//  PageRouter
//
//  Created by ucredit-XiaoYang on 2017/12/6.
//  Copyright © 2017年 xiaoyang. All rights reserved.
//

import UIKit

let Page = PageProvider<Router>()


/// 跳转控制路由，在这里添加要跳转页面
enum Router: String {
    case red        = "AAAViewController"        // 空白页
    case yellow     = "BBBViewController"        // 登录页面
    case blue       = "CCCViewController"        // 注册
}


extension Router: ControllerConvertible {
    // 目标类
    var target: UIViewController.Type {
        
        switch self {
        case .red:
            return AAAViewController.self
        case .yellow:
            return BBBViewController.self
        case .blue:
            return CCCViewController.self
        }
        
    }
    
    // 跳转方法
    var method: ControllerOperation {
        
        switch self {
        case .red:
            return .push
        case .yellow:
            return .present(parent: nil)
        case .blue:
            return .present(parent: UINavigationController.self)
        }
        
    }
    
    // 目标类标题
    var title: String? {
        
        switch self {
        case .red:
            return "controller_A"
        case .yellow:
            return "controller_B"
        case .blue:
            return "controller_C"
        }
        
    }
}
