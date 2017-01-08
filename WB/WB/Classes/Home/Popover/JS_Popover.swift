//
//  JS_Popover.swift
//  WB
//
//  Created by 浩哲 夏 on 2017/1/7.
//  Copyright © 2017年 浩哲 夏. All rights reserved.
//

import UIKit

class JS_Popover: NSObject {

    var isPresented : Bool = false
    
    var callBack : ((_ presented : Bool)->())
    
    init(callBack : @escaping (_ presented : Bool)->()) {
        self.callBack = callBack
    }
    
}
extension JS_Popover : UIViewControllerTransitioningDelegate{
    //自定义弹出view
    func presentationController(forPresented presented: UIViewController, presenting: UIViewController?, source: UIViewController) -> UIPresentationController? {
        return JS_PresentationController(presentedViewController: presented, presenting: presenting)
    }
    //for presented 自定义弹出动画
    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        isPresented = true
        callBack(isPresented)
        return self
    }
    
    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        isPresented = false
        callBack(isPresented)
        return self
    }

}

extension JS_Popover : UIViewControllerAnimatedTransitioning{
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return 0.5
    }
   
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        isPresented ? animationForPresentedView(transitionContext) : animationForDismissedView(transitionContext)
        
    }
    
    func animationForPresentedView(_ transitionContext : UIViewControllerContextTransitioning ){
        //获取弹出View
        let presentedView = transitionContext.view(forKey: UITransitionContextViewKey.to)!
        
        //将弹出的View 添加到containerView 上
        transitionContext.containerView.addSubview(presentedView)
        
        //执行动画
        presentedView.transform = CGAffineTransform(scaleX: 1.0, y: 0.0)
        presentedView.layer.anchorPoint = CGPoint.init(x: 0.5, y: 0)
        UIView.animate(withDuration: transitionDuration(using: transitionContext), animations: { () -> Void in
            presentedView.transform = CGAffineTransform.identity
        }, completion: { (_) -> Void in
            // 告诉转场上下文你已经完成动画
            transitionContext.completeTransition(true)
        })
    }
    func animationForDismissedView(_ transitionContext : UIViewControllerContextTransitioning ){
        //获取要消失的view
        let dismissView = transitionContext.view(forKey: UITransitionContextViewKey.from)!
        //执行动画
        UIView.animate(withDuration: transitionDuration(using: transitionContext), animations: {
            dismissView.transform = CGAffineTransform(scaleX: 1.0, y: 0.0000001)
        }) { (_) in
            dismissView.removeFromSuperview()
            //告诉转场已经完成动画
            transitionContext.completeTransition(true)
        }
    }
    
    
}
