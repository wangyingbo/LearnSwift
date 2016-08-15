//
//  main.swift
//  L010OO
//
//  Created by 王迎博 on 16/8/3.
//  Copyright © 2016年 王迎博. All rights reserved.
//

import Foundation

class Hi {
    func sayHi() -> Void {
        print("say hi wangyingbo")
    }
}
class hello: Hi {
    
    var _name:String
    init(name:String) {
        self._name = name
    }
    
    override func sayHi() {
        print("hello \(self._name)")
    }
}
var hi = Hi()
hi.sayHi()
var h = hello(name:"Zhang_Lisi")
h.sayHi()
print("\n\n")


/**
 *__类和结构体对比
 *  Swift 中类和结构体有很多共同点。共同处在于：
        定义属性用于存储值
        定义方法用于提供功能
        定义附属脚本用于访问值
        定义构造器用于生成初始化值
        通过扩展以增加默认实现的功能
        符合协议以对某类提供标准功能
 *__与结构体相比，类还有如下的附加功能：
        继承允许一个类继承另一个类的特征
        类型转换允许在运行时检查和解释一个类实例的类型
        解构器允许一个类实例释放任何其所被分配的资源
        引用计数允许对一个类的多次引用
 */
class student{
    var studname: String = ""
    var mark: Int = 0
    var mark2: Int = 0
}
let studrecord = student()
class MarksStruct {
    var mark: Int
    init(mark: Int) {
        self.mark = mark
    }
}
class studentMarks {
    var mark = 300
}
let marks = studentMarks()
print("成绩为 \(marks.mark)")
print("\n")


//作为引用类型访问类属性-类的属性可以通过 . 来访问。格式为：实例化类名.属性名
class student_Marks {
    var mark1 = 300
    var mark2 = 400
    var mark3 = 900
}
let marks_wang = student_Marks()
print("marks_wang is \(marks_wang.mark1)")
print("marks_wang is \(marks_wang.mark2)")
print("marks_wang is \(marks_wang.mark3)")
print("\n")


//恒等运算符
/**
 *  因为类是引用类型，有可能有多个常量和变量在后台同时引用某一个类实例。
 *  为了能够判定两个常量或者变量是否引用同一个类实例，Swift 内建了两个恒等运算符：
 *  恒等运算符 运算符为：===  如果两个常量或者变量引用同一个类实例则返回 true
 *  不恒等运算符 运算符为：!== 如果两个常量或者变量引用不同一个类实例则返回 true
 */
class SampleClass: Equatable {
    let myProperty:String
    init(s: String) {
        myProperty = s
    }
}
func ==(lhs: SampleClass, rhs: SampleClass) -> Bool {
    return lhs.myProperty == rhs.myProperty
}
let spClass1 = SampleClass(s: "hello")
let spClass2 = SampleClass(s: "hello")
if spClass1 === spClass2 {
    print("引用相同的类实例 \(spClass1)")
}
if spClass1 !== spClass2 {
    print("引用不相同的类实例 \(spClass2)")
}
print("\n")


//基类
class studDetails {
    var stname: String
    var mark1: Int!
    var mark2: Int!
    var mark3: Int!
    init(stname: String,mark1: Int,mark2: Int,mark3: Int) {
        self.stname = stname
        self.mark1 = mark1
        self.mark2 = mark2
        self.mark3 = mark3
    }
}
let stname = "wangyingbo"
let mark1 = 98
let mark2 = 99
let mark3 = 91
print(stname)
print(mark1)
print(mark2)
print(mark3)


//子类
/**
 *  子类是在一个已有类的基础上创建一个新的类
 *  为了知名某个类的超类，将超类名写在子类名的后面，用冒号分割
 */
class studentDetails {
    var mark1: Int
    var mark2: Int
    init(stm1:Int,results stm2:Int){
        mark1 = stm1
        mark2 = stm2
    }
    func show() {
        print("mark1:\(self.mark1),mark2:\(self.mark2)")
    }
}
class Tom: studentDetails {
    init(){
        super.init(stm1: 93, results: 89)
    }
}
let tom = Tom()
tom.show()
print("\n")


//重写
/**
 *  子类可以通过继承来的实例方法，类方法，实例属性，或下标脚本来实现自己的定制功能，我们把这种行为叫重写（overriding）。
 *  我们可以使用 override 关键字来实现重写。
 *  访问超类的方法、属性及下标脚本
        方法	super.somemethod()
        属性	super.someProperty()
        下标脚本	super[someIndex]
 */
class SuperClass {
    func show() -> Void {
        print("这是父类")
    }
}
class SubClass: SuperClass {
    override func show() {
        print("这是子类")
    }
}
let superClass = SuperClass()
superClass.show()
let subClass = SubClass()
subClass.show()
print("\n")


//重写属性
/**
 *  你可以提供定制的 getter（或 setter）来重写任意继承来的属性，无论继承来的属性是存储型的还是计算型的属性。
 *  子类并不知道继承来的属性是存储型的还是计算型的，它只知道继承来的属性会有一个名字和类型。所以你在重写一个属性时，必需将它的名字和类型都写出来。
 *  注意点：
        如果你在重写属性中提供了 setter，那么你也一定要提供 getter。
        如果你不想在重写版本中的 getter 里修改继承来的属性值，你可以直接通过super.someProperty来返回继承来的值，其中someProperty是你要重写的属性的名字。
 */
//以下实例我们定义了超类 Circle 及子类 Rectangle, 在 Rectangle 类中我们重写属性 area
class Circle {
    var radius = 12.5
    var area: String {
        return "矩形半径 \(radius)"
    }
}
class Rectangle: Circle {
    var print = 7
    override var area: String {
        return super.area + "，但现在被重写为 \(print)"
    }
}
let rect = Rectangle()
rect.radius = 25.0
rect.print = 3
print("Radius \(rect.area)")
print("\n")


//重写属性观察器
/**
 *  你可以在属性重写中为一个继承来的属性添加属性观察器。这样一来，当继承来的属性值发生改变时，你就会监测到。
 *  注意：你不可以为继承来的常量存储型属性或继承来的只读计算型属性添加属性观察器。
 */
class Square: Rectangle {
    override var radius: Double {
        didSet {
            print = Int(radius/5.0)+1
        }
    }
}
let sq = Square()
sq.radius = 100.0
print("半径：\(sq.radius)")
print("\n")


//防止重写
/**
 *  我们可以使用 final 关键字防止它们被重写。
 *  如果你重写了final方法，属性或下标脚本，在编译时会报错。
 *  你可以通过在关键字class前添加final特性（final class）来将整个类标记为 final 的，这样的类是不可被继承的，否则会报编译错误。
 */
final class my_circle {
    final var radius = 12.5
    var area: String {
        return "父类的半径为： \(radius)"
    }
}
//class myRectangle: my_circle {
//    var print = 7
//    override var area: String {
//        return super.area + "在这儿被重写为：\(print)"
//    }
//}



















