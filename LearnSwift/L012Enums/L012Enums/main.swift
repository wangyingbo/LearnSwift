//
//  main.swift
//  L012Enums
//
//  Created by 王迎博 on 16/8/4.
//  Copyright © 2016年 王迎博. All rights reserved.
//

import Foundation

print("Hello, World!")


/**
 *  枚举中定义的值（如 Sunday，Monday，……和Saturday）是这个枚举的成员值（或成员）。case关键词表示一行新的成员值将被定义。
 *  注意： 和 C 和 Objective-C 不同，Swift 的枚举成员在被创建时不会被赋予一个默认的整型值。在上面的DaysofaWeek例子中，Sunday，Monday，……和Saturday不会隐式地赋值为0，1，……和6。相反，这些枚举成员本身就有完备的值，这些值是已经明确定义好的DaysofaWeek类型。
        var weekDay = DaysofaWeek.THURSDAY
 *  weekDay的类型可以在它被DaysofaWeek的一个可能值初始化时推断出来。一旦weekDay被声明为一个DaysofaWeek，你可以使用一个缩写语法（.）将其设置为另一个DaysofaWeek的值：
        var weekDay = .THURSDAY
 *  当weekDay的类型已知时，再次为其赋值可以省略枚举名。使用显式类型的枚举值可以让代码具有更好的可读性。
 *  枚举可分为相关值与原始值。
 */
enum DaysofaWeek {
    case Sunday
    case Monday
    case Tuesday
    case Wednesday
    case Thursday
    case Friday
    case Staturday
}
var weekDay = DaysofaWeek.Thursday
weekDay = .Wednesday
switch weekDay
{
case .Sunday:
    print("星期天")
case .Monday:
    print("星期一")
case .Tuesday:
    print("星期二")
case .Wednesday:
    print("星期三")
case .Thursday:
    print("星期四")
case .Friday:
    print("星期五")
case .Staturday:
    print("星期六")
}
print("\n")


/**
 *  相关值
 *  以下实例中我们定义一个名为 Student 的枚举类型，它可以是 Name 的一个相关值（Int，Int，Int，Int），或者是 Mark 的一个字符串类型（String）相关值
 */
enum Student{
    case Name(String)
    case Mark(Int,Int,Int)
}
var studDetails = Student.Name("Runoob")
var studMarks = Student.Mark(98,97,95)
switch studMarks {
case .Name(let studName):
    print("学生的名字是: \(studName)。")
case .Mark(let Mark1, let Mark2, let Mark3):
    print("学生的成绩是: \(Mark1),\(Mark2),\(Mark3)。")
}


/**
 *  原始值
 *  原始值可以是字符串，字符，或者任何整型值或浮点型值。每个原始值在它的枚举声明中必须是唯一的。
 *  在原始值为整数的枚举时，不需要显式的为每一个成员赋值，Swift会自动为你赋值。
 *  例如，当使用整数作为原始值时，隐式赋值的值依次递增1。如果第一个值没有被赋初值，将会被自动置为0
 */
enum Month: Int {
    case January = 1, February, March, April, May, June, July, August, September, October, November, December
}
let yearMonth = Month.May.rawValue
print("数字月份为: \(yearMonth)。")
print("\n")