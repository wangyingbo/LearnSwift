//
//  ViewController.swift
//  testSwift01
//
//  Created by 王迎博 on 16/8/15.
//  Copyright © 2016年 王迎博. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let view1 = UIView.init()
        view1.frame = CGRect.init(origin: CGPoint.init(x: 100, y: 100), size: CGSize.init(width: 200, height: 100))
        view1.backgroundColor = UIColor.blueColor()
        self.view.addSubview(view1)
        
        
        let lable = UILabel(frame: CGRectMake(120, 40, 100, 20))
        lable.text = "小猪飞！"
        lable.textColor = UIColor.blueColor()
        lable.backgroundColor = UIColor.brownColor()
        lable.textAlignment = NSTextAlignment.Center
        lable.shadowColor = UIColor.grayColor()
        lable.shadowOffset = CGSizeMake(-5, 5)
        lable.font = UIFont(name: "zapfino", size: 20)
        self.view.addSubview(lable)
        
        let label1 = UILabel(frame: CGRectMake(50,200,60,40))
        label1.text = "试一试"
        label1.textColor = UIColor.blackColor()
        label1.backgroundColor = UIColor.whiteColor()
        label1.textAlignment = NSTextAlignment.Center
        label1.shadowColor = UIColor.purpleColor()
        label1.font = UIFont(name: "zapfino",size: 16)
        self.view.addSubview(label1)
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }


}

