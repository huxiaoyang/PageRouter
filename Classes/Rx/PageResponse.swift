//
//  Response.swift
//  Assistant
//
//  Created by UC on 2018/6/9.
//  Copyright © 2018 qiji. All rights reserved.
//

import Foundation
import UIKit


public final class PageResponse: CustomDebugStringConvertible {
    
    public let sourceController: UIViewController?
    
    public let target: ControllerConvertible
    
    public var parameters: [String: Any] = [:]
    
    public var callback: Complated = { _ in }
    
    
    public init(from source: UIViewController?, to router: ControllerConvertible) {
        
        self.sourceController = source
        self.target = router
        
    }
    
    public var description: String {
        return "sourceController: \(String(describing: sourceController)), parameters: \(parameters)"
    }

    
    public var debugDescription: String {
        return description
    }
    
}
