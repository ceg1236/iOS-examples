// Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

str = "heyheyhey"



name = "Carl"

var a = 3.5
var b:Double = 4
var c = a * b

str = "\(a) times \(4) is equal to \(c)"

var arr = [1, 2, 3, 4, 5]

arr.removeRange(1...3)

var dict = ["name":"CEG", "age":"25.9"]

dict["name"]
var name = dict["name"]

var myString = "my name is \(name!)"

// create array 2,4,6,8  remove 2, add 10 on end

var array = [2,4,6,8]
array.removeAtIndex(0)
array.append(10)

var test = "test"

if test == "test" {
    println("passes the \(test)")
}

var rando = arc4random_uniform(10)

var newStr = myString + "-- next text"

for char in newStr {
    println(char)
}

var newTypeString = NSString(string: newStr)

newTypeString.substringToIndex(5)

newTypeString.substringFromIndex(6)

newTypeString.substringWithRange(NSRange(location: 3, length:5))

newTypeString.containsString("CEG")

newTypeString.componentsSeparatedByString(" ")

newTypeString.uppercaseString

newTypeString.lowercaseString








