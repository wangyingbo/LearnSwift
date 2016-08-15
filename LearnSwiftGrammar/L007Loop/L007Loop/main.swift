//
//  main.swift
//  L007Loop
//
//  Created by 王迎博 on 16/8/3.
//  Copyright © 2016年 王迎博. All rights reserved.
//

import Foundation

var arr = []

for index in 0...9{
    print("\(index) * 5 = \(index * 5)")
}
print(arr)


var arr1 = ["item0","item1","item2"]
for item in arr1{
    print(item)
}


var i = 0
while i<arr1.count {
    print(arr1[i])
    i += 1
}


var dic = ["name":"wangyingbo","age":"26"]
for (key,value) in dic{
    print("\(key)___\(value)")
}


