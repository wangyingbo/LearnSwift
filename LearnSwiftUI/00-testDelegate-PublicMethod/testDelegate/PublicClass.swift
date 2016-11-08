//
//  PublicClass.swift
//  testDelegate
//
//  Created by 王迎博 on 16/11/8.
//  Copyright © 2016年 王迎博. All rights reserved.
//

import UIKit

public class PublicClass: NSObject {

    /**
     公共类的参数为函数的方法。相当于OC中的block
     - parameter para1:      参数1
     - parameter para2:      参数2
     - parameter completion: 函数参数，相当于block 
     */
    func publicBlockMethod(para1 para1: String, para2: String, completion:((test1: String, test2:String)->Void)) -> Void {
        
        YBLog(para1)
        YBLog(para2)
        
        let newStr1 = para1 + "/wangyingbo"
        let newStr2 = para2 + "/wangyingbo"
        
        completion(test1: newStr1, test2: newStr2)
    }
    
    
}
