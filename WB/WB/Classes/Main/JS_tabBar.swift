//
//  JS_tabBar.swift
//  WB
//
//  Created by 浩哲 夏 on 2017/1/3.
//  Copyright © 2017年 浩哲 夏. All rights reserved.
//

import UIKit

class JS_tabBar: UITabBar {

    override func layoutSubviews() {
        super.layoutSubviews()
        //子控制器个数
        let count : Int = (items?.count)!
        //宽高
        let tabButtonWidth : CGFloat = UIScreen.main.bounds.size.width / (CGFloat)(count+1)
        let tabButtonHeight : CGFloat = 44.0
        var i = 0
        var intemX :CGFloat = 0
        
        
        for tabBarButton : UIView in self.subviews {
            if tabBarButton .isKind(of: NSClassFromString("UITabBarButton")!) {
                if i==2 {
                    i+=1
                }
                intemX = (CGFloat)(i) * tabButtonWidth
                tabBarButton.frame = CGRect.init(x: intemX, y: 0, width: tabButtonWidth, height: tabButtonHeight)
                i += 1
            }
        }
        Btn.center = CGPoint.init(x: UIScreen.main.bounds.size.width * 0.5, y: tabButtonHeight * 0.5)
        addSubview(Btn)
        tintColor = UIColor.orange
        
}
    
    /// 懒加载 Btn
    lazy var Btn =  UIButton.init(imageName: #imageLiteral(resourceName: "tabbar_compose_icon_add"), highImageName: #imageLiteral(resourceName: "tabbar_compose_icon_add_highlighted"), title: "", bgImageName: #imageLiteral(resourceName: "tabbar_compose_button"), bgHighImage: #imageLiteral(resourceName: "tabbar_compose_button_highlighted"))

}
