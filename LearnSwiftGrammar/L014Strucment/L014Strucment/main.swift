//
//  main.swift
//  L014Strucment
//
//  Created by 王迎博 on 16/8/5.
//  Copyright © 2016年 王迎博. All rights reserved.
//

import Foundation

print("Hello, World!")

/**
 *  Swift 结构体是构建代码所用的一种通用且灵活的构造体。
 *  我们可以为结构体定义属性（常量、变量）和添加方法，从而扩展结构体的功能。
 *  与 C 和 Objective C 不同的是：
        结构体不需要包含实现文件和接口。
        结构体允许我们创建一个单一文件，且系统会自动生成面向其它代码的外部接口。
 *  结构体总是通过被复制的方式在代码中传递，因此它的值是不可修改的。
 */
struct MarkStruct {
    var mark1: Int
    var mark2: Int
    var mark3: Int
}
//我们可以通过结构体名来访问结构体成员。结构体实例化使用 let 关键字：
struct studentMarks {
    var mark1 = 100
    var mark2 = 78
    var mark3 = 28
}
let marks = studentMarks()
print("mark1是 \(marks.mark1)")
print("mark2是 \(marks.mark2)")
print("mark3是 \(marks.mark3)")
print("\n")


//通过结构体实例化时传值并克隆一个结构体
struct exampleStru {
    var mark0: Int
    init(mark1: Int) {
        self.mark0 = mark1
    }
}
var aStruct = exampleStru(mark1: 98)
var bStruct = aStruct
bStruct.mark0 = 97
print(aStruct.mark0)
print(bStruct.mark0)
print("\n")


//结构体的应用
/**
 *  在你的代码中，你可以使用结构体来定义你的自定义数据类型。
 *  结构体实例总是通过值传递来定义你的自定义数据类型。
 *  按照通用的准则，当符合一条或多条以下条件时，请考虑构建结构体：
        结构体的主要目的是用来封装少量相关简单数据值。
        有理由预计一个结构体实例在赋值或传递时，封装的数据将会被拷贝而不是被引用。
        任何在结构体中储存的值类型属性，也将会被拷贝，而不是被引用。
        结构体不需要去继承另一个已存在类型的属性或者行为。
 *  举例来说，以下情境中适合使用结构体：
        几何形状的大小，封装一个width属性和height属性，两者均为Double类型。
        一定范围内的路径，封装一个start属性和length属性，两者均为Int类型。
        三维坐标系内一点，封装x，y和z属性，三者均为Double类型。
 *  结构体实例是通过值传递而不是通过引用传递。
 */
struct mark_struct {
    var mark1: Int
    var mark2: Int
    var mark3: Int
    
    init(mark1: Int, mark2: Int, mark3: Int) {
        self.mark1 = mark1
        self.mark2 = mark2
        self.mark3 = mark3
    }
}
print("优异成绩:")
var marks_wang = mark_struct(mark1: 98,mark2: 95,mark3: 100)
print(marks_wang.mark1)
print(marks_wang.mark2)
print(marks_wang.mark3)
print("糟糕成绩:")
var marks_fail = mark_struct(mark1: 54,mark2: 42,mark3: 55)
print(marks_fail.mark1)
print(marks_fail.mark2)
print(marks_fail.mark3)
print("\n")


