import Foundation

// 1) check to see if collection of brackets is balanced
// what if there are multiple types of brackets?

func isBal(str: String) -> Bool {
    
    var count = 0
    return !str.characters.contains { ($0 == "[" ? ++count : --count) < 0 } && count == 0
}

isBal("[[[]]]") // true
isBal("[]][[]") // false



// chapter 1 - implement an algorithm to determine is a string has all unique characters.
// what if you can not use additional data strucs?

func isUnique(str: String) -> Bool {
    
    let strArray = Array(str.characters) // convert string to array of characters
    let strSet = Set(strArray)
    
    if strSet.count != strArray.count {
        print("boo - there are duplicate characters in \(str).")
        return false
    }
    print("yay - there are no duplicate characters in \(str)!")
    return true
}

isUnique("hello")
