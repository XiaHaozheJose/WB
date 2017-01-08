//
//  JS_PreviousView.swift
//  WB
//
//  Created by 浩哲 夏 on 2017/1/6.
//  Copyright © 2017年 浩哲 夏. All rights reserved.
//

import UIKit

class JS_PreviousView: UIView {
    
    // MARK:- 属性
    @IBOutlet weak var backgoundImage: UIImageView!
    @IBOutlet weak var iconImage: UIImageView!
    @IBOutlet weak var descLabel: UILabel!
    @IBOutlet weak var registerBtn: UIButton!
    @IBOutlet weak var LogInBtn: UIButton!
    
    
    // MARK:- 快速构造方法
    class func initWithXibView() ->JS_PreviousView {
        return Bundle.main.loadNibNamed("JS_PreviousView", owner: nil, options: nil)?.first as! JS_PreviousView
    }

}


// MARK: - 供外届调用接口
extension JS_PreviousView{
    
    func getPreviousProperty(imageName: String, descripText: String){
        iconImage.image = UIImage.init(named: imageName)
        descLabel.text = descripText
        backgoundImage.isHidden = true
    }
    
    func starAnimation(){
        let imageAnimation = CABasicAnimation.init(keyPath: "transform.rotation.z")
        imageAnimation.fromValue = 0
        imageAnimation.toValue = M_PI * 2
        imageAnimation.repeatDuration = CFTimeInterval(MAXFLOAT)
        imageAnimation.duration = 10
        imageAnimation.isRemovedOnCompletion = false
        backgoundImage.layer.add(imageAnimation, forKey: nil)
    }
    
}
