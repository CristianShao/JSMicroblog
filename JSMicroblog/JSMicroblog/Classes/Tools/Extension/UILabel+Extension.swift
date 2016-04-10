//
//  UILabel+Extension.swift
//  JSMicroblog
//
//  Created by ShaoJiansheng on 16/4/8.
//  Copyright © 2016年 ASM. All rights reserved.
//

import UIKit

extension UILabel{
    
    //在便利函数中，如果参数有默认值，则不用传递参数
    convenience  init(title : String, size :CGFloat = 14, color:UIColor = UIColor.darkGrayColor() ) {
        self.init()
        
        text = title;
        font = UIFont.systemFontOfSize(size)
        textColor = color
        numberOfLines = 0
        textAlignment = NSTextAlignment.Center
        
    }
    
    
}
