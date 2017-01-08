//
//  JS_BaseViewController.swift
//  WB
//
//  Created by 浩哲 夏 on 2017/1/6.
//  Copyright © 2017年 浩哲 夏. All rights reserved.
//

import UIKit

class JS_BaseViewController: UITableViewController {
    // MARK: - 懒加载
    lazy var preiousView : JS_PreviousView = JS_PreviousView.initWithXibView()
    

    
    var isLogin : Bool = true

    // MARK: - 系统回调

    override func loadView() {
        isLogin ? super.loadView() : setupPreviousView()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        guard isLogin else {
            setNavgationBar()
            return
        }
    }

}


// MARK: - 未登录显示视图

extension JS_BaseViewController{
    func setupPreviousView () {
        view = preiousView
        preiousView.registerBtn.addTarget(self, action: #selector(JS_BaseViewController.registerClick), for:.touchUpInside)
        preiousView.LogInBtn.addTarget(self, action: #selector(JS_BaseViewController.LoginClick), for:.touchUpInside)
    }
}

// MARK: - 设置UIBarButtonItem
extension JS_BaseViewController{
    
    //未登录时显示
   fileprivate func setNavgationBar(){
        navigationItem.leftBarButtonItem = UIBarButtonItem.init(title: "注册", style: .plain, target: self, action:#selector(JS_BaseViewController.registerClick))
        navigationItem.rightBarButtonItem = UIBarButtonItem.init(title: "登录", style: .plain, target: self, action:#selector(JS_BaseViewController.LoginClick))
    }
    
    }

// MARK: - 监听点击
extension JS_BaseViewController{
    
    // 未登录时点击
  @objc fileprivate func registerClick(){
        print("registerClick")
    }
  @objc fileprivate func LoginClick(){
        print("LoginClick")
    }
    
 
    
}



