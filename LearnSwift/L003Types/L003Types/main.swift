//
//  main.swift
//  L003Types
//
//  Created by 王迎博 on 16/8/3.
//  Copyright © 2016年 王迎博. All rights reserved.
//

import Foundation

var str = "hello"
var s:String = "world"
var i:Int = 100
var words:String = "wangyingbo"
print(words)


//类型定义
typealias Feet = Int
var distance:Feet = 100
print(distance)


// varA 会被推测为 Int 类型
var varA = 42
print(varA)
// varB 会被推测为 Double 类型
var varB = 3.14159
print(varB)
// varC 也会被推测为 Double 类型
var varC = 3 + 0.14159
print(varC)