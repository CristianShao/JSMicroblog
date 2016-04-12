//
//  OAuthViewController.swift
//  JSMicroblog
//
//  Created by ShaoJiansheng on 16/4/10.
//  Copyright © 2016年 ASM. All rights reserved.
//

import UIKit

class OAuthViewController: UIViewController {

    private lazy var web = UIWebView()
    
    // MARK : -点击方法
    @objc private func close() {
                dismissViewControllerAnimated(true, completion: nil)
    }
    @objc private func autoFill(){
        let js = "document.getElementById('userId').value = '15890072219';" +
        "document.getElementById('passwd').value = 'sjsznbzwd1992';"

        web.stringByEvaluatingJavaScriptFromString(js)
    }
    
    // MARK :- 界面设置
    override func loadView() {
        view = web
        
       web.delegate = self
          title = "登录新浪微博"
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "关闭", style: .Plain, target: self, action: "close")
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "自动填充", style: .Plain, target: self, action: "autoFill")
    }
    override func viewDidLoad() {
        super.viewDidLoad()
                // Do any additional setup after loading the view.
        self.web.loadRequest(NSURLRequest(URL: NetworkTools.sharedTools.oauthURL))
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

extension OAuthViewController :UIWebViewDelegate{
    func webView(webView: UIWebView, shouldStartLoadWithRequest request: NSURLRequest, navigationType: UIWebViewNavigationType) -> Bool {
        
        guard let url = request.URL where url.host == "www.baidu.com" else{
            return true
        }
        guard let query = url.query where query.hasPrefix("code=") else {
            return false
        }
        let code = query.substringFromIndex("code=".endIndex)
        
        UserAccountViewModel.sharedAccount.loadAccessToken(code) { (isSuccessed) -> () in
            if isSuccessed{
                print("OK")
                print(UserAccountViewModel.sharedAccount.account)
            }else{
                print("NO")
            }
        }
        return false
    }
}







