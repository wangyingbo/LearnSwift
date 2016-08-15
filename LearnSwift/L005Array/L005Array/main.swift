//
//  main.swift
//  L005Array
//
//  Created by 王迎博 on 16/8/3.
//  Copyright © 2016年 王迎博. All rights reserved.
//

import Foundation

var arr = ["hello","wang",100,2.3,"ying"]
print(arr)
var arr1 = []
var arr2:NSArray = []
var arr3 = [String]()
var someArray = [Int](count: 3,repeatedValue:0)


//创建一个类型为Int，大小为3，初始化值为0的空数组
var someInts = [Int](count: 3,repeatedValue:10000)
//创建了含有三个元素的数组
var someInta:[Int] = [10,20,30]
//取值
var someVar = someInta[0]
print("someVara:第一个元素的值 \(someVar)")
print("someVars:第二个元素的值 \(someInts[1])")


//修改数组
var someIntb = [Int]()
someIntb.append(20)
someIntb.append(30)
someIntb += [40]
//取值
var someVarb = someIntb[2]
print("someVarb:第一个元素的值 \(someVarb)")


//通过索引修改数组
var someIntc = [Int]()
someIntc.append(11)
someIntc.append(22)
someIntc += [33]
//修改元素
someIntc[2] = 44
//取值
print("someIntc:第三个元素的值 \(someIntc[2])")


//遍历数组
var someStrd = [String]()
someStrd.append("apple")
someStrd.append("Amazon")
someStrd.append("Runoob")
someStrd += ["Google"]
for item in someStrd {
    print("someStrd元素 \(item)")
}
//同时需要每个数据的值和索引值，可以使用String的enumerate()方法来进行数组遍历
for (index,item) in someStrd.enumerate() {
    print("在index = \(index)位置上的值为 \(item)")
}


//合并数组-合并两种已存在的相同类型数组,新数组的数据类型会从两个数组的数据类型中推断出来
var intArr1 = [Int](count:2,repeatedValue:10000)
var intArr2 = [Int](count:3,repeatedValue:22222)
var intArr = intArr1 + intArr2
print("合并后的数组intArr \(intArr)")


//count属性
print("合并后的数组intArr元素个数 \(intArr.count)")


//isEmpty属性
var intsA = [Int](count:2, repeatedValue: 2)
var intsB = [Int](count:3, repeatedValue: 1)
var intsC = [Int]()

print("intsA.isEmpty = \(intsA.isEmpty)")
print("intsB.isEmpty = \(intsB.isEmpty)")
print("intsC.isEmpty = \(intsC.isEmpty)")
        