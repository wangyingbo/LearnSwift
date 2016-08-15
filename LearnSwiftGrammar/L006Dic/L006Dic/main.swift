//
//  main.swift
//  L006Dic
//
//  Created by 王迎博 on 16/8/3.
//  Copyright © 2016年 王迎博. All rights reserved.
//

import Foundation

var dict = ["name":"wangyingbo","age":"25"]
dict["sex"]="male"
print(dict)
print(dict["name"])
print("\n")

/*
 Swift 字典用来存储无序的相同类型数据的集合，Swift 数组会强制检测元素的类型，如果类型不同则会报错。
 Swift 字典每个值（value）都关联唯一的键（key），键作为字典中的这个值数据的标识符。
 和数组中的数据项不同，字典中的数据项并没有具体顺序。我们在需要通过标识符（键）访问数据的时候使用字典，这种方法很大程度上和我们在现实世界中使用字典查字义的方法一样。
 Swift 字典的key没有类型限制可以是整型或字符串，但必须是唯一的。
 如果创建一个字典，并赋值给一个变量，则创建的字典就是可以修改的。这意味着在创建字典后，可以通过添加、删除、修改的方式改变字典里的项目。如果将一个字典赋值给常量，字典就不可修改，并且字典的大小和内容都不可以修改。
 */


//创建字典
//创建一个空字典，键类型为Int,值的类型为String
var someDic = [Int: String]()
//创建一个字典的实例
var someDict:[Int:String] = [1:"One",2:"Two",3:"Three"]
var someVar = someDict[1]
print("key = 1 的值为 \(someVar)")
print("key = 2 的值为 \(someDict[2])")
print("key = 3 的值为 \(someDict[3])")
print("\n")


//修改字典
var oldVar = someDict.updateValue("One 新的值", forKey: 1)
var someVarNew = someDict[1]
print( "key = 1 旧的值 \(oldVar)")
print("key = 1 的值为 \(someVarNew)")
print("key = 2 的值为 \(someDict[2])")
print("key = 3 的值为 \(someDict[3])")
print("\n")


//通过指定的key修改字典的值
var oldVar2 = someDict[2]
someDict[2] = "Two 新的值"
var someVar2 = someDict[2]
print("key = 2 的值为 \(oldVar2)")
print("key = 2 新的值为 \(someVar2)")
print("\n")


//移除键值对
//可以使用 removeValueForKey() 方法来移除字典 key-value 对。如果 key 存在该方法返回移除的值，如果不存在返回 nil
var removeValue = someDict.removeValueForKey(2)
print( "key = 1 的值为 \(someDict[1])" )
print( "key = 2 的值为 \(someDict[2])" )
print( "key = 3 的值为 \(someDict[3])" )
print("\n")


//通过指定的键的值为nil来移除
someDict[1] = nil
print( "key = 1 的值为 \(someDict[1])" )
print( "key = 2 的值为 \(someDict[2])" )
print( "key = 3 的值为 \(someDict[3])" )
print("\n")


//遍历字典
var someDictionary:[String:String] = ["name":"wang", "age":"26", "sex":"male"]
for (key, value) in someDictionary {
    print("字典key: \(key) - 字典value: \(value)")
}
print("\n")


//可以使用enumerate()方法来进行字典遍历，返回的是字典的索引及 (key, value) 对
var dictionary:[String:String] = ["name":"wang", "age":"26", "sex":"male"]
for (key, value) in dictionary.enumerate() {
    print("字典key: \(key) -- 字典(key, value)对: \(value)")
}
print("\n")


//字典转化为数组
let dictKeys = [String](dictionary.keys)
let dictValues = [String](dictionary.values)
print("输出字典的键(key)")
for (key) in dictKeys {
    print("\(key)")
}
print("输出字典的值(value)")
for (value) in dictValues {
    print("\(value)")
}
print("\n")


//count 属性
print("someDict1 含有 \(dictionary.count) 个键值对")
print("\n")