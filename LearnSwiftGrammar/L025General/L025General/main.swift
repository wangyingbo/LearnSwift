//
//  main.swift
//  L025General
//
//  Created by 王迎博 on 16/8/9.
//  Copyright © 2016年 王迎博. All rights reserved.
//

import Foundation

/**
 *  Swift 提供了泛型让你写出灵活且可重用的函数和类型。
 *  Swift 标准库是通过泛型代码构建出来的。
 *  Swift 的数组和字典类型都是泛型集。
 *  你可以创建一个Int数组，也可创建一个String数组，或者甚至于可以是任何其他 Swift 的类型数据数组。
 *  以下实例是一个非泛型函数 exchange 用来交换两个 Int 值：
 */
//定义一个交换两个变量的函数
func exchange(inout a: Int, inout b: Int) {
    let temp = a
    a = b
    b = temp
}
var num1 = 100
var num2 = 200
print("Int型交换前数据：\(num1) 和 \(num2)")
exchange(&num1, b: &num2)
print("Int型交换后数据：\(num1) 和 \(num2)")
//泛型可以访问任何类型，如Int或String
//以下实例是一个泛型函数exchange用来交换两个Int和String值
func exchange<T>(inout a: T, inout b: T) {
    let temp = a
    a = b
    b = temp
}
var str1 = "A"
var str2 = "B"
print("String交换前数据:  \(str1) 和 \(str2)")
exchange(&str1, b: &str2)
print("String交换后数据: \(str1) 和 \(str2)")
//这个函数的泛型版本使用了占位类型名字（通常此情况下用字母T来表示）来代替实际类型名（如Int、String或Double）。占位类型名没有提示T必须是什么类型，但是它提示了a和b必须是同一类型T，而不管T表示什么类型。只有 exchange(_:_:)函数在每次调用时所传入的实际类型才能决定T所代表的类型。
//另外一个不同之处在于这个泛型函数名后面跟着的占位类型名字（T）是用尖括号括起来的（）。这个尖括号告诉 Swift 那个T是 exchange(_:_:)函数所定义的一个类型。因为T是一个占位命名类型，Swift 不会去查找命名为T的实际类型。
print("\n")


//泛型类型
/**
 *  Swift 允许你定义你自己的泛型类型。
 *  自定义类、结构体和枚举作用于任何类型，如同Array和Dictionary的用法。
 */
struct TOS<T> {
    var items = [T]()
    mutating func push(item: T) {
        items.append(item)
    }
    mutating func pop() -> T {
        return items.removeLast()
    }
}
var tos = TOS<String>()
tos.push("Swift")
print(tos.items)
tos.push("泛型")
print(tos.items)
tos.push("类型参数")
print(tos.items)
tos.push("类型参数名")
print(tos.items)
//let deletetos = tos.pop()  //调用pop方法
print("\n")


//扩展泛型类型
/**
 *  当你扩展一个泛型类型的时候（使用 extension 关键字），你并不需要在扩展的定义中提供类型参数列表。更加方便的是，原始类型定义中声明的类型参数列表在扩展里是可以使用的，并且这些来自原始类型中的参数名称会被用作原始定义中类型参数的引用。
 */
//下面的例子扩展了泛型 TOS 类型，为其添加了一个名为 first 的只读计算属性，它将会返回当前栈顶端的元素而不会将其从栈中移除。
// 扩展泛型 TOS 类型
extension TOS {
    var first: T? {
        return items.isEmpty ? nil : items[items.count - 1]
    }
}
if let first = tos.first {
    print("栈顶部项：\(first)")
}
print("\n")


//类型约束
//类型约束指定了一个必须继承自指定类的类型参数，或者遵循一个特定的协议或协议构成。
/**
 *  你可以写一个在一个类型参数名后面的类型约束，通过冒号分割，来作为类型参数链的一部分。这种作用于泛型函数的类型约束的基础语法如下所示（和泛型类型的语法相同）：
         func someFunction<T: SomeClass, U: SomeProtocol>(someT: T, someU: U) {
         // 这里是函数主体
         }
 */
// 函数可以作用于查找一字符串数组中的某个字符串
func findStringIndex(array: [String], _ valueToFind: String) -> Int? {
    for (index, value) in array.enumerate() {
        if value == valueToFind {
            return index
        }
    }
    return nil
}
let strings = ["cat", "dog", "llama", "parakeet", "terrapin"]
if let foundIndex = findStringIndex(strings, "llama") {
    print("llama 的下标索引值为 \(foundIndex)")
}
print("\n")


//关联类型实例
/**
 *  Swift 中使用 typealias 关键字来设置关联类型。
 *  定义一个协议时，有的时候声明一个或多个关联类型作为协议定义的一部分是非常有用的。
 */
protocol Container {
    // 定义了一个ItemType关联类型
    associatedtype ItemType
    mutating func append(item: ItemType)
    var count: Int { get }
    subscript(i: Int) -> ItemType { get }
}
// 遵循Container协议的泛型TOS类型
struct TOS_1<T>: Container {
    // original Stack<T> implementation
    var items = [T]()
    mutating func push(item: T) {
        items.append(item)
    }
    mutating func pop() -> T {
        return items.removeLast()
    }
    // conformance to the Container protocol
    mutating func append(item: T) {
        self.push(item)
    }
    var count: Int {
        return items.count
    }
    subscript(i: Int) -> T {
        return items[i]
    }
}
var tos1 = TOS_1<String>()
tos.push("Swift")
print(tos.items)
tos.push("泛型")
print(tos.items)
tos.push("参数类型")
print(tos.items)
tos.push("类型参数名")
print(tos.items)
print("\n")


//Where 语句
/**
 *  类型约束能够确保类型符合泛型函数或类的定义约束。
 *  你可以在参数列表中通过where语句定义参数的约束。
 *  你可以写一个where语句，紧跟在在类型参数列表后面，where语句后跟一个或者多个针对关联类型的约束，以及（或）一个或多个类型和关联类型间的等价(equality)关系。
 */
/**
 *  下面的例子定义了一个名为allItemsMatch的泛型函数，用来检查两个Container实例是否包含相同顺序的相同元素。
 *  如果所有的元素能够匹配，那么返回一个为true的Boolean值，反之则为false。
 */
protocol Container2 {
    associatedtype ItemType
    mutating func append(item: ItemType)
    var count: Int { get }
    subscript(i: Int) -> ItemType { get }
}
struct Stack<T>: Container2 {
    // original Stack<T> implementation
    var items = [T]()
    mutating func push(item: T) {
        items.append(item)
    }
    mutating func pop() -> T {
        return items.removeLast()
    }
    // conformance to the Container protocol
    mutating func append(item: T) {
        self.push(item)
    }
    var count: Int {
        return items.count
    }
    subscript(i: Int) -> T {
        return items[i]
    }
}
func allItemsMatch<
    C1: Container2, C2: Container2
    where C1.ItemType == C2.ItemType, C1.ItemType: Equatable>
    (someContainer: C1, anotherContainer: C2) -> Bool {
    // 检查两个Container的元素个数是否相同
    if someContainer.count != anotherContainer.count {
        return false
    }
    // 检查两个Container相应位置的元素彼此是否相等
    for i in 0..<someContainer.count {
        if someContainer[i] != anotherContainer[i] {
            return false
        }
    }
    // 匹配所有项，返回 true
    return true
}
var tos2 = Stack<String>()
tos2.push("Swift")
print(tos2.items)
tos2.push("泛型")
print(tos2.items)
tos2.push("Where 语句")
print(tos2.items)
var eos = ["Swift", "泛型", "Where 语句"]
print(eos)
print("\n")


