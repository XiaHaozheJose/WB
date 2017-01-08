//
//  JS_PresentationController.swift
//  WB
//
//  Created by 浩哲 夏 on 2017/1/7.
//  Copyright © 2017年 浩哲 夏. All rights reserved.
//

import UIKit

class JS_PresentationController: UIPresentationController {

    
    
   fileprivate lazy var HudView : UIView = UIView()
   
    override func containerViewWillLayoutSubviews() {
        super.containerViewWillLayoutSubviews()
        let middleWidth : CGFloat = 200.0
        let middleHeight : CGFloat = 300.0
        presentedView?.frame = CGRect.init(x: (UIScreen.main.bounds.width - middleWidth )*0.5, y: 55, width: middleWidth, height: middleHeight)
        setupHudView()
    }
    
}
extension JS_PresentationController{
    func setupHudView(){
        
        containerView?.insertSubview(HudView, at: 0)
        HudView.frame = containerView!.bounds
        HudView.backgroundColor = UIColor.init(white: 0.8, alpha: 0.15)
        // 3.添加手势
        let tapGes = UITapGestureRecognizer(target: self, action: #selector(JS_PresentationController.hudViewClick))
        HudView.addGestureRecognizer(tapGes)
    }
}
// MARK:- 事件监听
extension JS_PresentationController {
    @objc fileprivate func hudViewClick() {
           presentedViewController.dismiss(animated: true, completion: nil)
    }
}
