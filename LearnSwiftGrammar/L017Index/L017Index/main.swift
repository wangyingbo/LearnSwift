//
//  main.swift
//  L017Index
//
//  Created by 王迎博 on 16/8/8.
//  Copyright © 2016年 王迎博. All rights reserved.
//下标脚本

import Foundation

/**
 *  下标脚本允许你通过在实例后面的方括号中传入一个或者多个的索引值来对实例进行访问和赋值。
 *  语法类似于实例方法和计算型属性的混合。
 *  与定义实例方法类似，定义下标脚本使用subscript关键字，显式声明入参（一个或多个）和返回类型。
 *  与实例方法不同的是下标脚本可以设定为读写或只读。这种方式又有点像计算型属性的getter和setter：
 */
struct subexample {
    let decrementer: Int
    subscript(index: Int) -> Int {
        return decrementer / index
    }
}
let division = subexample(decrementer: 100)
print("100 除以 9 等于 \(division[9])")
print("100 除以 2 等于 \(division[2])")
print("100 除以 3 等于 \(division[3])")
print("100 除以 5 等于 \(division[5])")
print("100 除以 7 等于 \(division[7])")
//通过 subexample 结构体创建了一个除法运算的实例。数值 100 作为结构体构造函数传入参数初始化实例成员 decrementer。
//你可以通过下标脚本来得到结果，比如 division[2] 即为 100 除以 2
print("\n")


class daysofaweek {
    private var days = ["Sunday", "Monday", "Tuesday", "Wednesday",
                        "Thursday", "Friday", "saturday"]
    subscript(index: Int) -> String {
        get {
            return days[index]   // 声明下标脚本的值
        }
        set(newValue) {
            self.days[index] = newValue   // 执行赋值操作
        }
    }
}
var p = daysofaweek()
print(p[0])
print(p[1])
print(p[2])
print(p[3])
print("\n")


//用法
/**
 *  根据使用场景不同下标脚本也具有不同的含义。
 *  通常下标脚本是用来访问集合（collection），列表（list）或序列（sequence）中元素的快捷方式。
 *  你可以在你自己特定的类或结构体中自由的实现下标脚本来提供合适的功能。
 *  例如，Swift 的字典（Dictionary）实现了通过下标脚本对其实例中存放的值进行存取操作。在下标脚本中使用和字典索引相同类型的值，并且把一个字典值类型的值赋值给这个下标脚来为字典设值：
 */
var numberOfLegs = ["spider": 8, "ant": 6, "cat": 4]
numberOfLegs["bird"] = 2
print(numberOfLegs)
//上例定义一个名为numberOfLegs的变量并用一个字典字面量初始化出了包含三对键值的字典实例。numberOfLegs的字典存放值类型推断为Dictionary。字典实例创建完成之后通过下标脚本的方式将整型值2赋值到字典实例的索引为bird的位置中。
print("\n")


//下标脚本选项
/**
 *  下标脚本允许任意数量的入参索引，并且每个入参类型也没有限制。
 *  下标脚本的返回值也可以是任何类型。
 *  下标脚本可以使用变量参数和可变参数。
 *  一个类或结构体可以根据自身需要提供多个下标脚本实现，在定义下标脚本时通过传入参数的类型进行区分，使用下标脚本时会自动匹配合适的下标脚本实现运行，这就是下标脚本的重载
 */
struct Matrix {
    let rows: Int, columns: Int
    var print: [Double]
    init(rows: Int, columns: Int) {
        self.rows = rows
        self.columns = columns
        print = Array(count: rows * columns, repeatedValue: 0.0)
    }
    subscript(row: Int, column: Int) -> Double {
        get {
            return print[(row * columns) + column]
        }
        set {
            print[(row * columns) + column] = newValue
        }
    }
}
// 创建了一个新的 3 行 3 列的Matrix实例
var mat = Matrix(rows: 3, columns: 3)
// 通过下标脚本设置值
mat[0,0] = 1.0
mat[0,1] = 2.0
mat[1,0] = 3.0
mat[1,1] = 5.0
// 通过下标脚本获取值
print("\(mat[0,0])")
print("\(mat[0,1])")
print("\(mat[1,0])")
print("\(mat[1,1])")
print("\n")








