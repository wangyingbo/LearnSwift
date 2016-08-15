//
//  ViewController.swift
//  L011HelloIOS
//
//  Created by 王迎博 on 16/8/3.
//  Copyright © 2016年 王迎博. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var wv:UIWebView!
    
    override func viewDidLoad() {
       wv.loadRequest(NSURLRequest(URL:NSURL(string:"http://wangyingbo.top")!))
    }


}

