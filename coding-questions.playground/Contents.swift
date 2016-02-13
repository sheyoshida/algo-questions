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



// given two strings, check to see if one string is a permutation of the other

func isPermutation(str1: String, str2: String) -> Bool {
    
    let array1 = Array(str1.characters)
    let array2 = Array(str2.characters)
  
    if array1.count != array2.count {
        return false
    } else {
        return  array1.sort(<) == array2.sort(<) // compare arrays in abc order
    }
}

isPermutation("cat", str2: "tac")
isPermutation("cat", str2: "dog")
isPermutation("caat", str2: "tacc")
isPermutation("cat", str2: "at")



// given a string, replace spaces with %20

func swapSpace(str: String) -> String {

    return str.stringByReplacingOccurrencesOfString(" ", withString: "%20")
}
swapSpace("Hello, World!")



// given a string, write a function to see if it is a permutation of a palindrome

func manyPermutation(str1: String, str2: String) -> Bool {
    
    let array1 = Array(str1.characters)// ["t", "a", "c", "o", " ", "c", "a", "t"]  -> {["t", "a
    let array2 = Array(str2.characters)
    
    if array1.count != array2.count {
        return false
    } else {
        return  array1.sort(<) == array2.sort(<) // compare arrays in abc order
    }
}
manyPermutation("taco cat", str2: "atco cta")












