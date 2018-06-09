//
//  PageRouter+Rx.swift
//  Assistant
//
//  Created by UC on 2018/6/9.
//  Copyright © 2018 qiji. All rights reserved.
//

import Foundation
import RxSwift


extension PageProvider: ReactiveCompatible {}



public extension Reactive where Base: PageProviderType {
    
    @discardableResult
    public func jump(from source: UIViewController? = UIViewController.topWindowController(), to router: Base.Target) -> Single<PageResponse> {
        return base.rxJump(from: source, to: router)
    }
    
}


internal extension PageProviderType {
    
    internal func rxJump(from source: UIViewController?, to router: Target) -> Single<PageResponse> {
        
        return Single.create { [weak self] single in
            
            self?.jump(from: source, to: router, with: [:], callBack: { _ in })
            
            let response = PageResponse.init(from: source, to: router)
            
            single(SingleEvent.success(response))
            
            return Disposables.create{}
            
        }
        
    }
    
}
