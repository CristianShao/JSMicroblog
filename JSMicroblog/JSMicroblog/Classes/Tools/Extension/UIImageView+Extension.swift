//
//  UIImageView+Extension.swift
//  JSMicroblog
//
//  Created by ShaoJiansheng on 16/4/8.
//  Copyright © 2016年 ASM. All rights reserved.
//

import UIKit

extension UIImageView{
    /**便利构造*/
    convenience init(imgName: String){
        self.init(image :UIImage(named: imgName))
    }
}
