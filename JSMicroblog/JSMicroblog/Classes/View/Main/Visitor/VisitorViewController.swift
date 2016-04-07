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
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
