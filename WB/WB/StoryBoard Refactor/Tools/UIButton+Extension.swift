//
//  UIButton+Extension.swift
//  WB
//
//  Created by 浩哲 夏 on 2017/1/3.
//  Copyright © 2017年 浩哲 夏. All rights reserved.
//

import UIKit

extension UIButton{
    
    convenience init(imageName : UIImage , highImageName :UIImage , title : String , bgImageName : UIImage,bgHighImage : UIImage) {
        self.init()
        setImage(imageName, for: .normal)
        setTitle(title, for: .normal)
        setBackgroundImage(bgImageName, for: .normal)
        setImage(highImageName, for: .selected)
        setImage(bgHighImage, for: .selected)
        sizeToFit()
    }
}
