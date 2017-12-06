//
//  CCCViewController.swift
//  PageRouter
//
//  Created by ucredit-XiaoYang on 2017/12/6.
//  Copyright © 2017年 xiaoyang. All rights reserved.
//

import UIKit

class CCCViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = UIColor.blue
        
        let leftItem = UIBarButtonItem.init(title: "close", style: .plain, target: self, action: #selector(close))
        
        navigationItem.leftBarButtonItem = leftItem
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
    @objc func close() {
        self.dismiss(animated: true, completion: nil)
    }
    
}
