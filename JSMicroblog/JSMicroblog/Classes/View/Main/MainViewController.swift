//
//  MainViewController.swift
//  JSMicroblog
//
//  Created by ShaoJiansheng on 16/4/7.
//  Copyright © 2016年 ASM. All rights reserved.
//

import UIKit
import  SnapKit
class MainViewController: UITabBarController {

    
//MARK :- 监听点击
    //使用 @objc 修饰符号，可以保证运行循环能够发送此消息，即使函数被标记为 private
   @objc private  func composedBtnClick(){
        
        print("zzz")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        addChildViewControllers()
        
        
        setupComposedBtn()
    }
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
       // print(tabBar.subviews)
        tabBar.bringSubviewToFront(composedBtn)
        
        
    }

    private lazy var composedBtn :UIButton = UIButton(imageName: "tabbar_compose_icon_add", bgImageName: "tabbar_compose_button")
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
//MARK: - 设置界面
extension MainViewController{
///添加中间编辑按钮
    private func setupComposedBtn(){
        tabBar.addSubview(composedBtn)
        
        //调整按钮
        let count  = childViewControllers.count
        //计算按钮的宽度 ，-1 是为了填充一个像素的空缺
        let w = tabBar.bounds.width/CGFloat(count)-1
        // 在tabbar的空间内 左右缩进2W的距离 上下缩进0
        composedBtn.frame = CGRectInset(tabBar.bounds, 2*w, 0)
        
        composedBtn.addTarget(self, action: "composedBtnClick", forControlEvents: .TouchUpInside)
    }
///添加所有控制器
     func addChildViewControllers() {
        tabBar.tintColor = UIColor.orangeColor()
        addChildViewController(HomeViewController(), title: "首页", imageName: "tabbar_home")
        addChildViewController(MessageViewController(), title: "消息", imageName: "tabbar_message_center")
        //添加一个占位控制器 ，为了空出tabbar中间按钮的位置
        addChildViewController(UIViewController())
        addChildViewController(DiscoverViewController(), title: "发现", imageName: "tabbar_discover")
        addChildViewController(ProfileViewController(), title: "我", imageName: "tabbar_profile")
    }

    
///添加控制器,重构构造方法
    private func addChildViewController(vc: UIViewController, title :String, imageName : String) {
        vc.title = title
        vc.tabBarItem.image = UIImage(named:imageName)
        let nav = UINavigationController(rootViewController: vc)
        
        addChildViewController(nav)
    }
}
