//
//  VisitorView.swift
//  JSMicroblog
//
//  Created by ShaoJiansheng on 16/4/7.
//  Copyright © 2016年 ASM. All rights reserved.
//

import UIKit

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
    private lazy var iconView: UIImageView = UIImageView(image: UIImage(named: "visitordiscover_feed_image_smallicon"))
    //遮罩图像
    private lazy var maskIconView: UIImageView = UIImageView(image: UIImage(named: "visitordiscover_feed_mask_smallicon"))
    
    //小房子
    private lazy var homeIconView: UIImageView = UIImageView(image: UIImage(named: "visitordiscover_feed_image_house"))
    //文字
    private lazy var messageLabel : UILabel = {
        let label = UILabel()
        
        label.text = "关注一些人，回这里看看有什么惊喜"
        label.textColor = UIColor.darkGrayColor()
        label.font = UIFont.systemFontOfSize(14)
        label.numberOfLines = 0
        label.textAlignment = NSTextAlignment.Center
        return label
    }()
    //注册按钮
    private lazy var registerBtn :UIButton = {
        let btn  = UIButton()
        btn.setTitle("注册", forState: .Normal)
        btn.setTitleColor(UIColor.orangeColor(), forState: .Normal)
        btn.setBackgroundImage(UIImage(named: "common_button_white_disable"), forState: .Normal)
        
        return btn
    } ()
    //登录按钮
    private lazy var loginBtn :UIButton = {
        let btn  = UIButton()
        btn.setTitle("登录", forState: .Normal)
        btn.setTitleColor(UIColor.darkGrayColor(), forState: .Normal)
        btn.setBackgroundImage(UIImage(named: "common_button_white_disable"), forState: .Normal)
        
        return btn
    } ()
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
        addConstraint(NSLayoutConstraint(item: iconView, attribute: .CenterX, relatedBy: .Equal, toItem: self, attribute: .CenterX, multiplier: 1.0, constant: 0))
        addConstraint(NSLayoutConstraint(item: iconView, attribute: .CenterY, relatedBy: .Equal, toItem: self, attribute: .CenterY, multiplier: 1.0, constant: -60))
        //小房子的约束
        addConstraint(NSLayoutConstraint(item: homeIconView, attribute: .CenterX, relatedBy: .Equal, toItem: iconView, attribute: .CenterX, multiplier: 1.0, constant: 0))
        addConstraint(NSLayoutConstraint(item: homeIconView, attribute: .CenterY, relatedBy: .Equal, toItem: iconView, attribute: .CenterY, multiplier: 1.0, constant: 0))
        //消息文字
        addConstraint(NSLayoutConstraint(item: messageLabel, attribute: .CenterX, relatedBy: .Equal, toItem: iconView, attribute: .CenterX, multiplier: 1.0, constant: 0))
        addConstraint(NSLayoutConstraint(item: messageLabel, attribute: .Top
            , relatedBy: .Equal, toItem: iconView, attribute: .Bottom, multiplier: 1.0, constant: 16))
        addConstraint(NSLayoutConstraint(item: messageLabel, attribute: .Width, relatedBy: .Equal, toItem: nil , attribute: .NotAnAttribute, multiplier: 1.0, constant: 224))
        addConstraint(NSLayoutConstraint(item: messageLabel, attribute: .Height, relatedBy: .Equal, toItem: nil , attribute: .NotAnAttribute, multiplier: 1.0, constant: 36))
        //注册按钮
        addConstraint(NSLayoutConstraint(item: registerBtn, attribute: .Left
            , relatedBy: .Equal, toItem: messageLabel, attribute: .Left, multiplier: 1.0, constant: 0))
        addConstraint(NSLayoutConstraint(item: registerBtn, attribute: .Top
            , relatedBy: .Equal, toItem: messageLabel, attribute: .Bottom, multiplier: 1.0, constant: 16))
        addConstraint(NSLayoutConstraint(item: registerBtn, attribute: .Width, relatedBy: .Equal, toItem: nil , attribute: .NotAnAttribute, multiplier: 1.0, constant: 100))
        addConstraint(NSLayoutConstraint(item: registerBtn, attribute: .Height, relatedBy: .Equal, toItem: nil , attribute: .NotAnAttribute, multiplier: 1.0, constant: 36))
        //登录按钮
        addConstraint(NSLayoutConstraint(item:loginBtn, attribute: .Right
            , relatedBy: .Equal, toItem: messageLabel, attribute: .Right, multiplier: 1.0, constant: 0))
        addConstraint(NSLayoutConstraint(item: loginBtn, attribute: .Top
            , relatedBy: .Equal, toItem: messageLabel, attribute: .Bottom, multiplier: 1.0, constant: 16))
        addConstraint(NSLayoutConstraint(item: loginBtn, attribute: .Width, relatedBy: .Equal, toItem: nil , attribute: .NotAnAttribute, multiplier: 1.0, constant: 100))
        addConstraint(NSLayoutConstraint(item: loginBtn, attribute: .Height, relatedBy: .Equal, toItem: nil , attribute: .NotAnAttribute, multiplier: 1.0, constant: 36))
        //遮罩图像
        addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("H:|-0-[mask]-0-|", options: [], metrics: nil , views: ["mask": maskIconView]))
        addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("V:|-0-[mask]-(height)-[registerBtn]", options: [], metrics: ["height": -36], views: ["mask":maskIconView, "registerBtn":registerBtn]))
        
        backgroundColor = UIColor(white: 237.0/255.0, alpha: 1.0)
    }
    
}
