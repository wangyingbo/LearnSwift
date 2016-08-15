//
//  main.swift
//  L009Funcs
//
//  Created by 王迎博 on 16/8/3.
//  Copyright © 2016年 王迎博. All rights reserved.
//

import Foundation

func sayHello(name:String) -> Void {
    print("hello \(name)")
}
sayHello("wangyingbo")
func getNum() ->(Int,Int){
    return (2,3)
}
let (a,b) = getNum()
print(a)
var fun = sayHello
fun("zhangsan")
print("\n")

//函数的定义
/**
 Swift 函数用来完成特定任务的独立的代码块。
 Swift使用一个统一的语法来表示简单的C语言风格的函数到复杂的Objective-C语言风格的方法。
    函数声明: 告诉编译器函数的名字，返回类型及参数。
    函数定义: 提供了函数的实体。
 
 Swift 定义函数使用关键字 func。
 定义函数的时候，可以指定一个或多个输入参数和一个返回值类型。
 每个函数都有一个函数名来描述它的功能。通过函数名以及对应类型的参数值来调用这个函数。函数的参数传递的顺序必须与参数列表相同。
 函数的实参传递的顺序必须与形参列表相同，-> 后定义函数的返回值类型。
 */
//实例
func funcname(para:String) -> Void {
    print("这是用来测试的: \(para)")
}
funcname("jiapin")
print("\n")


//函数调用
/**
 *  我们可以通过函数名以及对应类型的参数值来调用函数，函数的参数传递的顺序必须与参数列表相同。
 *  以下我们定义了一个函数名为 runoob 的函数，形参 site 的数据类型为 String，之后我们调用函数传递的实参也必须 String 类型，实参传入函数体后，将直接返回，返回的数据类型为 String
 */
func runoob(site:String) -> String {
    return site
}
print(runoob("http://wangyingbo.top"))
print("\n")


//函数参数
//函数可以接受一个或者多个参数，我们也可以使用元组（tuple）向函数传递一个或多个参数
func mult(para1:Int,para2:Int) -> Int {
    return para1 * para2
}
print(mult(2, para2: 3))
print(mult(4, para2: 15))
print(mult(5, para2: 31))
print("\n")


//不带参数函数
func funcWang () -> String {
    return ".......不带参数函数........."
}
print(funcWang())
print("\n")


//元组作为函数返回值
/**
 1、函数返回值类型可以是字符串，整型，浮点型等。
 2、元组与数组类似，不同的是，元组中的元素可以是任意类型，使用的是圆括号。
 你可以用元组（tuple）类型让多个值作为一个复合值从函数中返回。
 下面的这个例子中，定义了一个名为minMax(_:)的函数，作用是在一个Int数组中找出最小值与最大值。
 */
func minMax(array:[Int]) -> (min:Int, max:Int) {//如果你不确定返回的元组一定不为nil，那么你可以返回一个可选的元组类型
    var currentMin = array[0]
    var currentMax = array[0]
    for value in array[1..<array.count] {
        if value < currentMin {
            currentMin = value
        } else if value > currentMax {
            currentMax = value
        }
    }
    return (currentMin,currentMax)
}
let bounds = minMax([1,4,5,68,7,0,100])
print("最小值为 \(bounds.min),最大值为 \(bounds.max)")
print("bounds: \(bounds)")
print("\n")


//如果你不确定返回的元组一定不为nil，那么你可以返回一个可选的元组类型
/**
 *  前面的minMax(_:)函数返回了一个包含两个Int值的元组。但是函数不会对传入的数组执行任何安全检查，如果array参数是一个空数组，如上定义的minMax(_:)在试图访问array[0]时会触发一个运行时错误。
 *  为了安全地处理这个"空数组"问题，将minMax(_:)函数改写为使用可选元组返回类型，并且当数组为空时返回nil：
 */
func maxMin(array:[Int]) -> (min:Int,max:Int)? {
    if array.isEmpty {
        return nil
    }
    var currentMin = array[0]
    var currentMax = array[0]
    for value in array[1..<array.count] {
        if value < currentMin {
            currentMin = value
        } else if value > currentMax {
            currentMax = value
        }
    }
    return (currentMin,currentMax)
}
if let bound = maxMin([8, -6, 2, 109, 3, 71]) {
    print("最小值为 \(bound.min)，组大值为 \(bound.max)")
}
print("\n")


//函数参数名称
//函数参数都有一个外部参数名和一个局部参数名
//局部参数名在函数的实现内部使用
func sample(number: Int) {
    print(number)
}
sample(1)
sample(2)
sample(3)
print("\n")


//外部参数名
//可以在局部参数名前指定外部参数名，中间以空格分隔，外部参数名用于在函数调用时传递给函数的参数
//如果你提供了外部参数名，那么函数在被调用时，必须使用外部参数名
func pow(firstArg a: Int, secondArg b: Int) -> Int {
    var res = a
    for _ in 1..<b {
        res = res * a
    }
    print(res)
    return res
}
pow(firstArg:5, secondArg:3)
print("\n")


//可变参数
/**
 *  可变参数可以接受零个或多个值。函数调用时，你可以用可变参数来指定函数参数，其数量是不确定的。
 *  可变参数通过在变量类型名后面加入（...）的方式来定义
 */
func vari<N>(members: N...){
    for i in members {
        print(i)
    }
}
vari(4,3,5)
vari(4.5, 3.1, 5.6)
vari("Google", "Baidu", "Runoob")
print("\n")


//常量，变量及I/O参数
/**
  *  一般默认在函数中定义的参数都是常量参数，也就是这个参数你只可以查询使用，不能改变它的值。
  *   如果想要声明一个变量参数，可以在前面加上var，这样就可以改变这个参数的值了。
  *   例如：
     func  getName(var id:String).........
     此时这个id值可以在函数中改变。
  *   一般默认的参数传递都是传值调用的，而不是传引用。 所以传入的参数在函数内改变，并不影响原来的那个参数。传入的只是这个参数的副本。
  *   变量参数，正如上面所述，仅仅能在函数体内被更改。如果你想要一个函数可以修改参数的值，并且想要在这些修改在函数调用结束后仍然存在，那么就应该把这个参数定义为输入输出参数（In-Out Parameters）。
  *   定义一个输入输出参数时，在参数定义前加 inout 关键字。一个输入输出参数有传入函数的值，这个值被函数修改，然后被传出函数，替换原来的值。
 */
func swapTwoInts(var a:Int,var b:Int) -> Void {
//‘var’parameters are deprecated and will be removed in Swift 3
    let t = a
    a = b
    b = t
}
var x = 0,y = 100
print("x = \(x) ;y = \(y)")
swapTwoInts(x, b:y)
print("x = \(x) ;y = \(y)")
print("\n")


//使用inout关键字修改
func swapTwo(inout a:Int,inout b:Int){
    print("a = \(a) ;b = \(b)")
    let t = a
    a = b
    b = t
    print("a = \(a) ;b = \(b)")
}
var m = 0,n = 100
print("m = \(m) ;n = \(n)")
swapTwo(&x, b:&y)
print("m = \(m) ;n = \(n)")
print("\n")


//函数类型及使用
/**
 *  在 Swift 中，使用函数类型就像使用其他类型一样。例如，你可以定义一个类型为函数的常量或变量，并将适当的函数赋值给它：
        var addition: (Int, Int) -> Int = sum
 *  解析:
    "定义一个叫做 addition 的变量，参数与返回值类型均是 Int ，并让这个新变量指向 sum 函数"。
 *  sum 和 addition 有同样的类型，所以以上操作是合法的。
 *  现在，你可以用 addition 来调用被赋值的函数了
 */
func sum(a:Int,b:Int) -> Int {
    return a + b
}
var addition: (Int,Int) -> Int = sum
print("输出结果: \(addition(40, 80))")
print("\n")


//函数类型作为参数类型、函数类型作为返回类型
//我们可以将函数作为参数传递给另外一个参数
func another(addition: (Int, Int) -> Int, a:Int, b:Int) {
    print("输出结果: \(addition(a, b))")
}
another(sum, a: 10, b: 20)
print("\n")


//函数嵌套
//函数嵌套指的是函数内定义一个新的函数，外部的函数可以调用函数内定义的函数
func calcDecrement(forDecrement total: Int) -> () -> Int {
    var overallDecrement = 0
    func decrementer() -> Int {
        overallDecrement -= total
        return overallDecrement
    }
    return decrementer
}
let decrem = calcDecrement(forDecrement: 30)
print(decrem())


