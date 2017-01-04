//
//  JS_MainViewController.swift
//  WB
//
//  Created by 浩哲 夏 on 2017/1/3.
//  Copyright © 2017年 浩哲 夏. All rights reserved.
//

import UIKit

class JS_MainViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        addchildViewController(childVC: JS_HomeViewController(), title: "首页", imageName: "tabbar_home")
        addchildViewController(childVC: JS_DiscoverViewController(), title: "发现", imageName: "tabbar_discover")
        addchildViewController(childVC: JS_MessageViewController(), title: "消息", imageName: "tabbar_message_center")
        addchildViewController(childVC: JS_ProfileViewController(), title: "我的", imageName: "tabbar_profile")
        changeTabBar()
        
}
    func changeTabBar(){
        let tabBar = JS_tabBar()
        setValue(tabBar, forKey: "tabBar")
    }
    
   private func addchildViewController(childVC : UIViewController , title : String , imageName : String){
    
     let childNavVC = UINavigationController.init(rootViewController: childVC)
     addChildViewController(childNavVC)
    
    var imageNormal = UIImage.init(named: imageName)
    imageNormal = imageNormal?.withRenderingMode(UIImageRenderingMode.alwaysOriginal)
    childNavVC.tabBarItem.image = imageNormal
    
    var imageSelected = UIImage.init(named: imageName + "_highlighted")
    imageSelected = imageSelected?.withRenderingMode(.alwaysOriginal)
    childNavVC.tabBarItem.selectedImage = imageSelected
    
    childNavVC.tabBarItem.title = title
}
    
    
}
