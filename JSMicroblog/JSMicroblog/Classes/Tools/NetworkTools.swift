//
//  NetworkTools.swift
//  JSMicroblog
//
//  Created by ShaoJiansheng on 16/4/10.
//  Copyright © 2016年 ASM. All rights reserved.
//

import UIKit
import AFNetworking

enum JSRequestMethod :String{
    case GET = "GET"
    case POST = "POST"
}

class NetworkTools: AFHTTPSessionManager {
    
    private let   appKey = "1250003047"
    private let  appSecret = "3e76c401a7d3bb1aa12a0a95c1ac07d4"
    private let  redirectID = "http://www.baidu.com"
    
    typealias JSRequestCallBack  = (success : AnyObject?, error : NSError?)->()
    static let sharedTools : NetworkTools = {
        
        let instance  = NetworkTools(baseURL: nil)
        instance.responseSerializer.acceptableContentTypes?.insert("text/plain")
        
        return instance
        
    }()
}

// MARK: - OAuth相关
extension NetworkTools {
    
    var oauthURL: NSURL {
        let urlStr = "https://api.weibo.com/oauth2/authorize?client_id=\(appKey)&redirect_uri=\(redirectID)"
        
        return NSURL(string : urlStr)!
    }
    
    func loadAcessToken(code :String, finished :JSRequestCallBack){
        
        let urlStr  = "https://api.weibo.com/oauth2/access_token"
        let params = ["client_id": appKey, "client_secret": appSecret, "grant_type":"authorization_code","code":code, "redirect_uri":redirectID]
        
        request(.POST, urlString: urlStr, params: params, finished: finished)
    }
    //根据accessToken 加载数据
    func loadData(accessToken :String, finished :JSRequestCallBack){
        let urlStr = "https://api.weibo.com/2/statuses/public_timeline.json"
        let params = ["access_token" : accessToken]
        
        request(.GET, urlString: urlStr, params: params, finished: finished)
        
    }
    
}



extension NetworkTools{
    
    func request(method : JSRequestMethod, urlString :String, params: [String: AnyObject]?, finished :JSRequestCallBack){
        
        //成功的回调
        let success =  { (task : NSURLSessionDataTask, result: AnyObject?) -> Void in
            finished(success: result, error: nil)
        }
        
        //失败的回调
        let  failure   = { (task : NSURLSessionDataTask?, error  : NSError) -> Void in
            finished(success: nil, error:error)
        }
        
        if method == JSRequestMethod.GET {
            GET(urlString, parameters: params, success: success, failure:failure)
        }else{
            POST(urlString, parameters: params, success: success, failure:failure)
        }
    }
    
}

