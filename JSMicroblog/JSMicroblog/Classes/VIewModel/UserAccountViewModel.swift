//
//  UserAccountViewModel.swift
//  JSMicroblog
//
//  Created by ShaoJiansheng on 16/4/12.
//  Copyright © 2016年 ASM. All rights reserved.
//

import Foundation


class  UserAccountViewModel{
    
    //单例对象
    static let sharedAccount = UserAccountViewModel()
    
    //用户模型
    var account :UserAccount?
    
    //获取Token值
    var token :String?{
        if !isExpired{
            return account?.access_token
        }
        return nil
    }
    
    //用户登录状况判断
     var logon :Bool{
        
        return account?.access_token != nil  && !isExpired
    }
    
    //获得沙盒路径，计算性属性
    private var accountPath :String{
        
        let path = NSSearchPathForDirectoriesInDomains(.DocumentDirectory, .UserDomainMask, true) .last!
        return  (path as NSString).stringByAppendingPathComponent("account.plist")
    }
    //判断是否过期
    private var isExpired:Bool{
        
        if account?.expiresDate?.compare(NSDate()) == NSComparisonResult.OrderedDescending{
                return false
        }
        return true
    }
    
    
    //构造方法，给用户数据解档，因为没有继承 ，所以不用写OVERRIDE,私有化后只能通过单例方法创建对象
   private init(){
        
     account = NSKeyedUnarchiver.unarchiveObjectWithFile(accountPath) as? UserAccount
        
        if isExpired{
            print("账户过期")
            account = nil
        }
        
        print(account)
        
    }
}
// MARK: - 用户相关的网络请求
//重构View里的代🐴
extension UserAccountViewModel{
    
    func loadAccessToken(code :String, finished :(isSuccessed :Bool)->()){
        NetworkTools.sharedTools.loadAcessToken(code) { (success, error) -> () in
            if error != nil {
                print(error)
                //失败的回调
                finished(isSuccessed: false)
                return
            }
             self.account = UserAccount(dict: success as![String :AnyObject])
            //根据accesstoken 获得用户信息
            self.loadAccount(self.account!, finished :finished)
        }
    }
    
    //保存用户信息
    private func loadAccount(account :UserAccount,finished :(isSuccessed :Bool)->()){
        
        NetworkTools.sharedTools.loadUserInfo(account.uid!) { (success, error) -> () in
            
            if error != nil{
                print(error)
                finished(isSuccessed: false)
                return
            }
            guard let dict = success as? [String :AnyObject] else {
                
                finished(isSuccessed: false)
                print("格式错误")
                return
            }
            //保存用户信息
            account.screen_name = dict["screen_name"] as? String
            account.avatar_large = dict["avatar_large"] as? String
            //归档
            print(account)
            //直接调用归档的方法
            NSKeyedArchiver.archiveRootObject(account, toFile: self.accountPath)
            print(self.accountPath)
           // account.saveUserAccount()
            
            //成功的回调
            finished(isSuccessed: true)
        }
    }
}





