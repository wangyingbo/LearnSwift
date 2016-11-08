//
//  PublicMethod.swift
//  06-MyLocation
//
//  Created by 王迎博 on 16/8/24.
//  Copyright © 2016年 王迎博. All rights reserved.
//

import Foundation
import UIKit

/**
 自定义调试打印信息
 */
public func YBLog<T>(message : T, file : String = #file, lineNumber : Int = #line) {
    
    #if DEBUG
        
        let fileName = (file as NSString).lastPathComponent
        print("[\(fileName):line:\(lineNumber)]- \(message)")
        
    #endif
}

