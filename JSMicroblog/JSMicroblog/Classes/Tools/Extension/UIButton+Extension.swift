//
//  UIButton+Extension.swift
//  JSMicroblog
//
//  Created by ShaoJiansheng on 16/4/7.
//  Copyright © 2016年 ASM. All rights reserved.
//

import UIKit

extension UIButton{
    
    convenience init(imageName : String ,bgImageName : String) {
            self.init()
        setImage(UIImage(named: imageName), forState: .Normal)
        setImage(UIImage(named: imageName+"_highlighted"), forState: .Highlighted)
        setBackgroundImage(UIImage(named: bgImageName), forState: .Normal)
        setBackgroundImage(UIImage(named: bgImageName+"_highlighted"), forState: .Highlighted)
        sizeToFit()
    }
    
}