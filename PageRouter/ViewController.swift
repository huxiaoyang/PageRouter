//
//  ViewController.swift
//  PageRouter
//
//  Created by ucredit-XiaoYang on 2017/12/6.
//  Copyright © 2017年 xiaoyang. All rights reserved.
//

import UIKit
import RxSwift


class ViewController: UIViewController {
    
    let disposeBag = DisposeBag()

    
    var tableView: UITableView!
    
    let titles = ["AAAViewController", "BBBViewController", "CCCViewController"]
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView = UITableView.init(frame: self.view.bounds, style: .plain)
        tableView.estimatedRowHeight = 0
        tableView.rowHeight = 44
        tableView.tableFooterView = UIView()
        tableView.delegate = self
        tableView.dataSource = self
        
        view.addSubview(tableView)
        
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        tableView.frame = view.bounds
    }


}



extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return titles.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        cell.textLabel?.text = titles[indexPath.row]
        
        return cell
        
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        let title = titles[indexPath.row]
        
        let type = Router(rawValue: title)
        
        guard let target = type else {
            return
        }
        
        Page.rx.jump(from: self, to: target)
            .subscribe()
            .disposed(by: disposeBag)

        
//        Page.jump(from: self, to: target) { dict in
//
//            print(dict)
//
//        }
        
    }
    
}

