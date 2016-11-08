//
//  CustomView.swift
//  testDelegate
//
//  Created by 王迎博 on 16/11/8.
//  Copyright © 2016年 王迎博. All rights reserved.
//
import UIKit

private let  KLMargin:CGFloat  = 10
private let  KLLabelHeight:CGFloat  = 30
private let  KLScreenWidth = UIScreen.mainScreen().bounds.size.width

import UIKit

class CustomView: UIView {
    // 闭包 类似oc中的block
    var buttonCallBack:(() -> ())?
    
    // 重写init方法
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.backgroundColor = UIColor.orangeColor()
        let lable: UILabel = UILabel(frame: CGRectMake(KLMargin, KLMargin, KLScreenWidth - (22 * KLMargin), KLLabelHeight))
        lable.text = "我丫就是一label"
        lable.textAlignment = NSTextAlignment.Center
        lable.backgroundColor = UIColor.lightGrayColor()
        self.addSubview(lable)
        
        
        let button:UIButton = UIButton()
        button.frame = CGRectMake(KLMargin, CGRectGetMaxY(lable.frame) + KLMargin, KLScreenWidth - (22 * KLMargin), KLLabelHeight)
        button.backgroundColor = UIColor.lightTextColor()
        button.setTitle("俺是个按钮啊", forState: UIControlState.Normal)
        button.addTarget(self, action: #selector(CustomView.buttonCllick(_:)), forControlEvents: UIControlEvents.TouchUpInside)
        button.layer.cornerRadius = 5
        button.clipsToBounds = true
        self.addSubview(button)
        
    }
    
    // 反正重写了init方法这个会根据提示自动蹦出来
    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // 按钮点击事件的调用
    func buttonCllick(button: UIButton){
        if buttonCallBack != nil {
            buttonCallBack!()
        }
    }
    
    // 重新绘制和oc里面效果一样（其实我也不是很明白）
    override func drawRect(rect: CGRect) {
        //self.backgroundColor = UIColor.whiteColor()
    }

}
