//
//  UserAccount.swift
//  JSMicroblog
//
//  Created by ShaoJiansheng on 16/4/12.
//  Copyright © 2016年 ASM. All rights reserved.
//

import UIKit

/// - look: [http://open.weibo.com/wiki/OAuth2/access_token](http://open.weibo.com/wiki/OAuth2/access_token)
class UserAccount: NSObject ,NSCoding{
    
    var access_token :String?
    var expires_in : NSTimeInterval = 0{
        didSet{
            expiresDate = NSDate(timeIntervalSinceNow: expires_in)
        }
    }
    // 过期日期
    var expiresDate :NSDate?
    //当前授权用户的UID
    var uid : String?
    var screen_name :String?
    var avatar_large :String?
    
    //重构
    init(dict : [String : AnyObject]) {
           super.init()
        setValuesForKeysWithDictionary(dict)
    }
    override func setValue(value: AnyObject?, forUndefinedKey key: String) {}
    
   override  var description :String{
    
        let keys = ["access_token", "expires_in", "expiresDate", "uid", "screen_name", "avatar_large"]
    
        return dictionaryWithValuesForKeys(keys).description
    }
    

    
    //归档
    func encodeWithCoder(aCoder: NSCoder) {
        aCoder.encodeObject(access_token, forKey: "access_token")
        aCoder.encodeObject(expiresDate , forKey: "expiresDate")
        aCoder.encodeObject(uid, forKey: "uid")
        aCoder.encodeObject(screen_name, forKey: "screen_name")
        aCoder.encodeObject(avatar_large , forKey: "avatar_large")
    }
    //解档
    required init?(coder aDecoder: NSCoder) {
        access_token = aDecoder.decodeObjectForKey("access_token") as? String
        expiresDate = aDecoder.decodeObjectForKey("expiresDate") as? NSDate
        uid = aDecoder.decodeObjectForKey("uid") as? String
        screen_name = aDecoder.decodeObjectForKey("screen_name") as? String
        avatar_large = aDecoder.decodeObjectForKey("avatar_large")as? String
    }

}

