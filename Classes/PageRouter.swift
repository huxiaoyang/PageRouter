//
//  PageRouter.swift
//  Assistant
//
//  Created by ucredit-XiaoYang on 2017/12/4.
//  Copyright © 2017年 qiji. All rights reserved.
//

import UIKit

/// 跳转方式
public enum ControllerOperation {
    case push
    case present(parent: UINavigationController.Type?)
}


/// 待跳转 controller 信息协议
public protocol ControllerConvertible {
    
    // 目标类
    var target: UIViewController.Type {get}
    
    // 跳转方法
    var method: ControllerOperation {get}
    
    // 目标类标题
    var title: String? {get}
    
}


/// 页面路由传参
public protocol ViewControllerIntent {
    func putExtra<T>(_ key: String, _ value: T)
    func getExtra<T>(_ key: String) -> T?
}


extension UIViewController: ViewControllerIntent {
    
    // 扩展一个字典用于传参
    private struct intentStorage {
        static var extra: [String : Any] = [:]
    }
    
    public func putExtra<T>(_ key: String, _ value: T) {
        intentStorage.extra[key] = value
    }
    
    public func getExtra<T>(_ key: String) -> T? {
        return intentStorage.extra[key] as? T
    }
    
}
