//
//  JS_NavLogInBarButton.swift
//  WB
//
//  Created by 浩哲 夏 on 2017/1/6.
//  Copyright © 2017年 浩哲 夏. All rights reserved.
//

import UIKit

class JS_NavLogInBarButton: UIButton {

    convenience init(imageName : String, title : String , selecImage : String) {
        self.init()
        setTitle(title, for: .normal)
        setImage(UIImage.init(named: imageName), for: .normal)
        setImage(UIImage.init(named: imageName + "_highlighted"), for: .highlighted)
        setImage(UIImage.init(named: selecImage), for: .selected)
        
        sizeToFit()
    }
    override init(frame: CGRect) {
        super.init(frame: frame)
        setTitle("JS_WB ", for: .normal)
        setImage(UIImage(named: "navigationbar_arrow_down"), for: UIControlState())
        setImage(UIImage(named: "navigationbar_arrow_up"), for: .selected)
        setTitleColor(UIColor.orange, for: UIControlState())
        sizeToFit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        titleLabel?.frame.origin.x = 0
        imageView?.frame.origin.x = (titleLabel?.frame.size.width)!
    }

}
