//
//  main.swift
//  L004Strings
//
//  Created by 王迎博 on 16/8/3.
//  Copyright © 2016年 王迎博. All rights reserved.
//

import Foundation

var str = "hello "
var i = 200
str = str + "wangyingbo"
str = "\(str),assasss,\(i)"
print(str)


//创建字符串
// 使用字符串字面量
var stringA = "Hello, World!"
print( stringA )
// String 实例化
var stringB = String("Hello, World!")
print( stringB )
//空字符串
var stringC = ""
if stringC.isEmpty {
    print("stringC 是空的")
} else {
    print("stringC 不是空的")
}
//实例化String类来创建空字符串
let stringD = String()
if stringD.isEmpty {
    print("stringD 是空的")
} else {
    print("stringD 不是空的")
}


//字符串常量
//可以将一个字符串赋值给一个变量或常量，变量是可修改的，常量是不可修改的
//可修改的
var stringE = "菜鸟教程"
stringE += "http://www.runoob.com"
print("stringE \(stringE)")
//不可修改的
let stringF = String("菜鸟教程")
//stringF += "http://www.runoob.com" //会报错


//字符串中插入值
//字符串插值是一种构建新字符串的方式，可以在其中包含常量、变量、字面量和表达式。 您插入的字符串字面量的每一项都在以反斜线为前缀的圆括号中
var varA = 20
let constA = 100
var varC:Float = 20.0
var stringG = "\(varA) 乘以 \(constA) 等于 \(varC * 100)"
print("stringG \(stringG)")


//字符串连接
let constB = "王颖博"
let constC = "http://wangyingbo.top"
var stringH = constB + constC
print("stringH \(stringH)")


//字符串长度
//可以使用 == 来比较两个字符串是否相等
var varB = "hello, swift"
var varD = "hello, world"
if varB == varD {
    print("\(varB) 与 \(varD) 相等")
} else {
    print("\(varB) 与 \(varD) 不相等")
}


//Unicode字符串
var unicodeString = "王颖博"
print("UTF-8 编码:")
for code8 in unicodeString.utf8 {
    print("\(code8)")
}
print("\n")
print("UTF-16 编码:")
for code16 in unicodeString.utf16 {
    print("\(code16)")
}


/*
字符串函数及运算符
Swift 支持以下几种字符串函数及运算符：
序号	函数/运算符 & 描述
    1
    isEmpty
    判断字符串是否为空，返回布尔值
    2
    hasPrefix(prefix: String)
    检查字符串是否拥有特定前缀
    3
    hasSuffix(suffix: String)
    检查字符串是否拥有特定后缀。
    4
    Int(String)
    转换字符串数字为整型。 实例:
    let myString: String = "256"
    let myInt: Int? = Int(myString)
    5
    String.characters.count
    计算字符串的长度
    6
    utf8
    您可以通过遍历 String 的 utf8 属性来访问它的 UTF-8 编码
    7
    utf16
    您可以通过遍历 String 的 utf8 属性来访问它的 UTF-16 编码
    8
    unicodeScalars
    您可以通过遍历String值的unicodeScalars属性来访问它的 Unicode 标量编码.
    9
        +
    连接两个字符串，并返回一个新的字符串
    10
        +=
    连接操作符两边的字符串并将新字符串赋值给左边的操作符变量
    11
        ==
    判断两个字符串是否相等
    12
        <
        比较两个字符串，对两个字符串的字母逐一比较。
    13	
        !=
        比较两个字符串是否不相等。
*/