//
//  JS_HomeViewController.swift
//  WB
//
//  Created by 浩哲 夏 on 2017/1/3.
//  Copyright © 2017年 浩哲 夏. All rights reserved.
//

import UIKit

class JS_HomeViewController: JS_BaseViewController {
    
    
    fileprivate lazy var leftBtn: JS_NavLogInBarButton = {
        let btn: JS_NavLogInBarButton = JS_NavLogInBarButton.init(imageName: "navigationbar_friendattention", title: "", selecImage: "")
        btn.addTarget(self, action: #selector(JS_HomeViewController.leftButtonClick), for: UIControlEvents.touchUpInside)
        
        return btn
    }()
   fileprivate lazy var rightBtn: JS_NavLogInBarButton = {
        let btn: JS_NavLogInBarButton = JS_NavLogInBarButton.init(imageName: "navigationbar_pop", title: "", selecImage: "")
        btn.addTarget(self, action: #selector(JS_HomeViewController.rightButtonClick), for: UIControlEvents.touchUpInside)
        return btn
    }()
    
   fileprivate lazy var middleBtn: JS_NavLogInBarButton = JS_NavLogInBarButton()
    
   fileprivate lazy var middleView: JS_MiddleViewController = {
        let middleView = JS_MiddleViewController()
        return middleView
    }()
    
    fileprivate lazy var popoverAnimator : JS_Popover = JS_Popover {[weak self] (presented) -> () in
        self?.middleBtn.isSelected = presented
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "首页"
        preiousView.starAnimation()
        guard isLogin else {
            return
        }
        //登录时显示导航栏按钮
        setNavigationBarIsLogIn()
    }
    
    
    
}

// MARK: - 设置NavBarItem
extension JS_HomeViewController{
    //登录时显示
    fileprivate func setNavigationBarIsLogIn(){
        navigationItem.leftBarButtonItem = UIBarButtonItem.init(customView: leftBtn)
        navigationItem.rightBarButtonItem = UIBarButtonItem.init(customView: rightBtn)
        navigationItem.titleView = middleBtn
        middleBtn.addTarget(self, action: #selector(JS_HomeViewController.middleBtnClick), for: UIControlEvents.touchUpInside)
    }

}

// 监听点击
extension JS_HomeViewController{
  
    
    @objc fileprivate func leftButtonClick(){
        print("leftButtonClick")
        
    }
    
    @objc fileprivate func rightButtonClick(){
        print("rightButtonClick")
        
    }
    
    @objc fileprivate func middleBtnClick(){
        let middleView = JS_MiddleViewController()
        //设置modal 效果为自定义
        middleView.modalPresentationStyle = .custom
        middleView.transitioningDelegate = popoverAnimator
        present(middleView, animated: true, completion: nil)
        
    }
    
}

    
