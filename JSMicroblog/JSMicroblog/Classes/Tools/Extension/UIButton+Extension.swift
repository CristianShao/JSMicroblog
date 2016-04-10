//
//  UIButton+Extension.swift
//  JSMicroblog
//
//  Created by ShaoJiansheng on 16/4/7.
//  Copyright © 2016年 ASM. All rights reserved.
//

import UIKit


extension UIButton{
    /** tabbar编辑按钮的便利构造*/
    convenience init(imageName : String ,bgImageName : String) {
            self.init()
        setImage(UIImage(named: imageName), forState: .Normal)
        setImage(UIImage(named: imageName+"_highlighted"), forState: .Highlighted)
        setBackgroundImage(UIImage(named: bgImageName), forState: .Normal)
        setBackgroundImage(UIImage(named: bgImageName+"_highlighted"), forState: .Highlighted)
        sizeToFit()
    }
    
    /** 按钮的便利构造*/
    convenience init(title: String, size :CGFloat, titleColor :UIColor, bgImg:String? ){
        self.init()
        setTitle(title, forState: .Normal)
        titleLabel?.font = UIFont.systemFontOfSize(size)
        setTitleColor(titleColor, forState: .Normal)
        if let backgroundImage = bgImg {
            setBackgroundImage(UIImage(named: backgroundImage), forState: .Normal)
        }
        
    }
    
    
    
}