//
//  AAAViewController.swift
//  PageRouter
//
//  Created by ucredit-XiaoYang on 2017/12/6.
//  Copyright © 2017年 xiaoyang. All rights reserved.
//

import UIKit

class AAAViewController: UIViewController {
    
    private var callback: Complated!
    

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = UIColor.red
        
        
        let close = UIButton(type: .custom)
        close.frame = CGRect.init(x: 100, y: 300, width: 120, height: 50)
        close.setTitle("close", for: .normal)
        close.backgroundColor = UIColor.red
        view.addSubview(close)
        close.addTarget(self, action: #selector(makeCallback), for: .touchUpInside)
        
        
        callback = getExtra(Page.callback)!
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    

    @objc func makeCallback() {
        
        self.callback(["key": "value"])
        
    }


}
