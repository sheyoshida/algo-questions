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



// remove duplicate values from array (disregard final order)

func removeDup(num: [Int]) -> [Int] {
    
    let setNum = Set(num)
    let arrNum = Array(setNum)

    return arrNum
}
removeDup([42, 31, 22, 22, 55, 44, 44])


// remove duplicate values from array and return sorted array

func removeDupAndSort(num: [Int]) -> [Int] {
    
    let setNum = Set(num)
    let arrNum = Array(setNum)
    
    return arrNum.sort(<)
}
removeDupAndSort([42, 31, 22, 22, 55, 44, 44])



// remove the duplicate values from an array, preserve original order of array

func removeDuplicates(num: [Int]) -> [Int] {
    
    var setNum = Set<Int>() // create empty set and array
    var arrNum = Array<Int>()
    
    for i in num {
        if !setNum.contains(i) {
            arrNum.insert(i, atIndex: arrNum.endIndex)
            setNum.insert(i)
        }
    }
    return arrNum
}
removeDuplicates([42, 31, 22, 22, 55, 44, 44])



// reverse an integer

func reverseInt(num: Int) -> Int {

    
    return 0
}
















