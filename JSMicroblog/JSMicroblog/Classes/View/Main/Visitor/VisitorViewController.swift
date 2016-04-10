//
//  VisitorViewController.swift
//  JSMicroblog
//
//  Created by ShaoJiansheng on 16/4/7.
//  Copyright © 2016年 ASM. All rights reserved.
//

import UIKit

class VisitorViewController: UITableViewController {

    private var userLogin = false
    
    var visitorView :VisitorView?
    
    override func loadView() {
        userLogin ? super.loadView() : setupVisitorView()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    private func setupVisitorView(){
        visitorView = VisitorView()
       // visitorView?.backgroundColor = UIColor.blueColor()
        view  = visitorView
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "登录", style: .Plain, target: self, action: "loginBtnClick")
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "注册", style: .Plain, target: self, action: "registerBtnClick")
        visitorView?.registerBtn.addTarget(self, action: "registerBtnClick", forControlEvents: .TouchUpInside)
        visitorView?.loginBtn.addTarget(self, action: "loginBtnClick", forControlEvents: .TouchUpInside)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
// MARK: - 监听方法
extension VisitorViewController{
    
    func loginBtnClick() {
        print("登录")
    }
    
    func registerBtnClick() {
        print("注册")
    }
}
