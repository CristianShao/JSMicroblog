//
//  VisitorView.swift
//  JSMicroblog
//
//  Created by ShaoJiansheng on 16/4/7.
//  Copyright © 2016年 ASM. All rights reserved.
//

import UIKit
import SnapKit

class VisitorView: UIView {
    
    //图片为可选项
    func setupInfo(title : String , imageName : String?){
        messageLabel.text = title
        
        guard let imgName = imageName else{
            
            startAnimate()
            return
        }
        
        iconView.image  = UIImage(named: imgName)
        
        homeIconView.hidden = true
        sendSubviewToBack(maskIconView)
        
    }
    private func startAnimate(){
        let anim = CABasicAnimation(keyPath: "transform.rotation")
        anim.toValue = 2 *  M_PI
        anim.duration = 17
        anim.repeatCount = MAXFLOAT
        
        //不断重复的动画 放动画所在的图层被销毁时，动画也被销毁
        anim.removedOnCompletion = false
        
        iconView.layer.addAnimation(anim, forKey: nil)
    }
    
    // MARK: - 构造函数
    // initWithFrame 是 UIView 的指定构造函数
    // 使用纯代码开发使用的
   override init(frame: CGRect) {
        super.init(frame: frame)
            setupUI()
    }
    // initWithCoder - 使用 SB & XIB 开发加载的函数
    // 使用 sb 开始的入口
   required init?(coder aDecoder: NSCoder) {
    // 导致如果使用 SB 开发，调用这个视图，会直接崩溃
     //  fatalError("init(coder:) has not been implemented")
        super.init(coder: aDecoder)
        setupUI()
   }
    
    //MARK: -懒加载控件
    //图标
    private lazy var iconView: UIImageView = UIImageView(imgName: "visitordiscover_feed_image_smallicon")
    //遮罩图像
    private lazy var maskIconView: UIImageView = UIImageView(imgName: "visitordiscover_feed_mask_smallicon")
    
    //小房子
    private lazy var homeIconView: UIImageView = UIImageView(imgName: "visitordiscover_feed_image_house")
    //文字
    private lazy var messageLabel : UILabel = UILabel(title: "关注一些人，回这里看看有什么惊喜")
    //注册按钮
     lazy var registerBtn :UIButton = UIButton(title: "注册", size: 18, titleColor: UIColor.orangeColor(), bgImg: "common_button_white_disable")
    
    //登录按钮
    lazy var loginBtn :UIButton = UIButton(title: "登录", size: 18, titleColor: UIColor.darkGrayColor(), bgImg: "common_button_white_disable")
    
}

extension VisitorView{
    
    private func setupUI(){
        
        addSubview(iconView)
        addSubview(maskIconView)
        addSubview(homeIconView)
        addSubview(messageLabel)
        addSubview(registerBtn)
        addSubview(loginBtn)
        for v in subviews{
            v.translatesAutoresizingMaskIntoConstraints = false
        }
        
        
        //图标的约束
        iconView.snp_makeConstraints { (make) -> Void in
            make.centerX.equalTo(self.snp_centerX)
            make.centerY.equalTo(self.snp_centerY).offset(-60)
        }
        //小房子的约束
        homeIconView.snp_makeConstraints { (make) -> Void in
            make.center.equalTo(iconView.snp_center)
        }
        //消息文字
        messageLabel.snp_makeConstraints { (make) -> Void in
            make.centerX.equalTo(iconView.snp_centerX)
            make.top.equalTo(iconView.snp_bottom).offset(16)
            make.width.equalTo(224)
            make.height.equalTo(36)
        }
        //注册按钮
        registerBtn.snp_makeConstraints { (make) -> Void in
            make.left.equalTo(messageLabel.snp_left)
            make.top.equalTo(messageLabel.snp_bottom).offset(16)
            make.width.equalTo(100)
            make.height.equalTo(36)
        }
    
        //登录按钮
        loginBtn.snp_makeConstraints { (make) -> Void in
            make.right.equalTo(messageLabel.snp_right)
            make.top.equalTo(registerBtn.snp_top)
            make.size.equalTo(registerBtn.snp_size)
        }
        //遮罩图像
        maskIconView.snp_makeConstraints { (make) -> Void in
            make.left.equalTo(self.snp_left)
            make.right.equalTo(self.snp_right)
            make.top.equalTo(self.snp_top)
            make.bottom.equalTo(registerBtn.snp_bottom)
        }

        
        backgroundColor = UIColor(white: 237.0/255.0, alpha: 1.0)
    }
    
}
