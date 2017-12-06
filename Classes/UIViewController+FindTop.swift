//
//  UIViewController+FindTop.swift
//  Assistant
//
//  Created by ucredit-XiaoYang on 2017/10/17.
//  Copyright © 2017年 qiji. All rights reserved.
//

import UIKit

extension UIViewController {
    
    private class func getCurrentWindow() -> UIWindow? {
        var window: UIWindow? = UIApplication.shared.keyWindow
        if let w = window, w.windowLevel != UIWindowLevelNormal {
            for tempWindow in UIApplication.shared.windows {
                if tempWindow.windowLevel == UIWindowLevelNormal  {
                    window = tempWindow
                    break
                }
            }
        }
        return window
    }
    
    
    // MARK: 获取当前window上controller
    private class func getTopWindowController(_ viewController: UIViewController?) -> UIViewController? {
        
        guard let controller = viewController else {
            return nil
        }
        
        if let VC = controller.presentedViewController {
            return getTopWindowController(VC)
        }
        
        if controller.isKind(of: UISplitViewController.self) {
            let VC = controller as! UISplitViewController
            
            if VC.viewControllers.count > 0 {
                return getTopWindowController(VC.viewControllers.last)
            }
            
            return VC
        }
        
        if controller.isKind(of: UINavigationController.self) {
            let VC = controller as! UINavigationController
            
            if VC.viewControllers.count > 0 {
                return getTopWindowController(VC.topViewController)
            }
            
            return VC
        }
        
        if controller.isKind(of: UITabBarController.self) {
            let VC = controller as! UITabBarController
            
            guard let controllers = VC.viewControllers, controllers.count > 0 else {
                return VC
            }
            
            return getTopWindowController(VC.selectedViewController)
        }
        
        return controller
    }
    
    
    class func topWindowController() -> UIViewController? {
        
        guard let window = UIViewController.getCurrentWindow() else {
            return nil;
        }
        
        return getTopWindowController(window.rootViewController!)
    }
    
    
}


