//
//  PageProvider.swift
//  Assistant
//
//  Created by ucredit-XiaoYang on 2017/10/17.
//  Copyright © 2017年 qiji. All rights reserved.
//
//  页面跳转使用，例：
//      Page.jump(to: .login)
//  参数使用，例：
//      1. LoginViewController 页面 let value = getExtra("key")


import UIKit


public typealias Complated = ([String : Any]) -> Void


public protocol PageProviderType: AnyObject {
    
    associatedtype Target: ControllerConvertible
    
    func jump(from source: UIViewController?, to router: Target, with parameters: [String : Any], callBack handler: @escaping Complated)
    
}



public class PageProvider<target: ControllerConvertible>: PageProviderType {

    public let callback = "PageProvider.callback"
    
    public init() {}
    
    
    public func jump(
        from source: UIViewController? = UIViewController.topWindowController(),
        to router: target,
        with parameters: [String : Any] = [:],
        callBack handler: @escaping Complated = { _ in }
        )
    {
        
        // 实例化目标对象
        let viewController = router.target.init()
        
        // 设置目标对象title
        if let title = router.title {
            viewController.title = title
        }
        
        // 配置目标对象需要参数
        if parameters.count > 0 {
            
            for (key, value) in parameters {
                
                viewController.putExtra(key, value)
                
            }
        
        }
        
        // 配置回调闭包
        viewController.putExtra(callback, handler)
        
        // 获取当前对象
        guard let windowController = source else {return}
        
        // 跳转逻辑
        DispatchQueue.main.async {
            
            switch router.method {
                
            case .push:
                
                guard let nav = windowController.navigationController else {
                    return
                }
                
                nav.pushViewController(viewController, animated: true)
                
            case .present(let parent):
                
                guard let parent = parent else {
                    
                    windowController.present(viewController, animated: true)
                    
                    return
                }
                
                let nav = parent.init(rootViewController: viewController)
                
                windowController.present(nav, animated: true)
                
            }
            
        }
        
    }
    
}


