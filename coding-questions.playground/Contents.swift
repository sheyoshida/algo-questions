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
  
    return  array1.sort(<) == array2.sort(<) // sort and compare arrays in abc order
}

isPermutation("cat", str2: "tac") // test it!
isPermutation("cat", str2: "dog")
isPermutation("caat", str2: "tacc")



// given a string, replace spaces with %20
func swapSpace(str: String) -> String {
    
    return str.stringByReplacingOccurrencesOfString(" ", withString: "%20")
}
swapSpace("Hello, World!")


    
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



//// reverse an integer
//func reverseInt(num: Int) -> Int {
//
//    var intArr: Array<Int> = [] // placeholder array
//    
//    var numStr = String(num)
//    var strArr = Array(numStr.characters)
//    
//    for item in strArr {
////        intArr.insert(item, atIndex: 0)
//    }
//    
//    return 0
//}
//reverseInt(543)



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


// return n!
func factorial(num: Int) -> Int {
    if num == 0 {
        return 1
    }
    return num * (factorial(num - 1))
}
factorial(3)



// what is runtime for swift's array.sort()?
// Answer: O(n log n)



// create function to call the previous function
func sayHello() {
    print("oh, hello!")
}

func talkingToMyComputer(greeting: String){
    let myGreetings = ["hello", "hi", "salutations", "bonjour", "salut", "konichiwa"]
    
    for word in myGreetings {
        if greeting == word {
            sayHello()
        }
    }
}
talkingToMyComputer("hi")



// fizzbuzz
func fizzBuzz(min: Int, max: Int) {
    
    for number in min...max {
         let result = (number % 3, number % 5)  // tuples are so swifty!
        
        switch result {
        case (0, 0):
            print("FizzBuzz")
        case (0, _):
            print("Fizz")
        case (_, 0):
            print("Buzz")
        default:
            print("\(number)")
        }
    }
}
fizzBuzz(1, max: 100)



// given an array, return the minimum value

func minValue(var numbers: [Int]) -> Int {
    
//    numbers = numbers.sort() // 1) if we can use a sort function: O(n log n)
//    numbers.minElement() // 2) or just ask for min element: O(n)
//    let minNum = numbers.reduce(Int.max, combine: { min($0, $1)}) // 3) or use reduce
    
    for i in 0...numbers.count-1 {
        for j in 0...numbers.count-1 { // O(n^2)
            
            if numbers[i] < numbers[j] {
//              swap(&numbers[i], &numbers[j]) // 4) swap is cool!
                let temp = numbers[i] // bubble sort: O(n^2)
                numbers[i] = numbers[j]
                numbers[j] = temp
            }
        }
    }
    return numbers[0]
}
minValue([10, 5, 9, 7, 3, 2, 37, 4])




// given an array, return min and max values:
func minAndMax(var num: [Int]) -> [Int] {
    
    var minElementAndMaxElement: Array<Int> = [] // new array to return values
    
    
    for i in 0...num.count-1 { // 1) sort the array
        for j in 0...num.count-1 { // bubble sort: O(n^2) <--- inefficient!
            if num[i] < num[j] {
                let temp = num[i]
                num[i] = num[j]
                num[j] = temp
            }
        }
    }
    
    let firstItem = num.first
    let lastItem = num.last
    
    minElementAndMaxElement.append(firstItem!) // 2) add first and last items to array
    minElementAndMaxElement.append(lastItem!)

    return minElementAndMaxElement
}
minAndMax([5, 3, 7, 9, 21, 2])



// revised: return min and max from array:
func findMinAndMax(nums: [Int]) -> [Int] {
    
    var lowestAndHighest: Array<Int> = []
    var lowest: Int = nums[0]
    var highest: Int = nums[0]
    
    for num in nums { // O(n) <--- faster
        
        if lowest > num {
            lowest = num
        } else {
            if highest < num {
                highest = num
            }
        }
        
        lowestAndHighest.append(lowest) // append at index 0
        lowestAndHighest.insert(highest, atIndex: lowestAndHighest.endIndex) // append at index 1
    }
    return lowestAndHighest
}
findMinAndMax([5, 3, 7, 9, 21, 2])
    


// check two arrays for common elements
func containCommonItems(arr1: [Int], arr2: [Int]) -> [Int] {
    
    var doubles: Array<Int> = []
    for i in arr1 {
        for j in arr2 {
            if i == j {
                doubles.append(i)
                }
            }
        }
    return doubles
    }
containCommonItems([1, 2, 3, 4, 5], arr2: [6, 7, 8, 9, 10]) // O(n^2)



// write algorithm that prints from 1-100 and then back down again

// 1) with two for loops:
func printNums() {
    for i in 1...10 {
        print(i)
        if i == 10 {
            printNumsDown()
        }
    }
}

func printNumsDown() {
    for i in (1...9).reverse() {
        print (i)
    }
}
// printNums()

// 2) recursively:

func printUp(n: Int) {
    if n == 100 {
        print(n)
        printDown(n - 1)
        return
    }
    print(n)
    printUp(n + 1)
}

func printDown(n: Int) {
    if n == 1 {
        print(n)
        return
    }
    print(n)
    printDown(n - 1)
}
//printUp(1)



// rotate matrix 90 degrees
/*
[[1, 2, 3], 
 [4, 5, 6], 
 [7, 8, 9]]

would be: 

[[7, 4, 1],
 [8, 5, 2], 
 [7, 8, 9]]
*/

func rotateMatrix90Degrees(inout matrix: [[Int]]) {
    
    var columns = [[Int]]()
    
    for i in 0..<matrix.count {
        columns.append(getColumn(matrix, col: i))
    }
    for i in 0..<matrix.count {
        matrix[i] = columns[i]
    }
}

func getColumn(matrix: [[Int]], col: Int) -> [Int] {
    
    var colArray = [Int]()
    
    // run through the column from the bottom up
    // add values to colArray
    
    for i in 0..<matrix.count {
        colArray.append(matrix[matrix.count - i - 1][col])
    }
    return colArray
}

var myArray = [[1, 2, 3],[4, 5, 6],[7, 8, 9]]
myArray

rotateMatrix90Degrees(&myArray)









// check array for missing number in consecutive numbers, return that number (to reuse numbers)

// assign that number to a customer


// take in string, return letter that appears the most frequently
//func mostCommonLetter(word: String) -> String? {
//    
//    var tracker: Dictionary<String,Int> = [:]
//    
//    var count: Int = 1
//    let wordArray = word.characters.map {String($0)} // convert to array of strings
//    
//    var letter: String? = nil
//    var largestNumber = 0
//    
//    for letter in wordArray {
//        
//        if !tracker.keys.contains(letter) {
//            tracker[letter] = count
//        } else {
//            
//        }
//  
//    }
//    
//    print(tracker)
//
//    return letter
//}
//    
//
//mostCommonLetter("heellloe")



//adding / multiplying / traversing multi dimensional arrays
//caesar cypher
//tic tac toe
//Check to see if string is balanced (())
//Given three numbers return the median
//Fibonacci - given an idx return the fib value at idx
//given a jumble: String and knownWords: [String] return list of potential words that the string may be.
//given a string, return the letter that appears most frequently
//
//Given two int arrays v1 and v2 return 1 if  v1 is greater  -1 if v2 is greater and 0 if they are equal. V1 and V2 are like software versions
//
//Given two numbers add them up and return an array or string version of the result ie: 5 + 12 = [1,7] or “17”
//
//how many golf balls could you fit in a school bus?
//
//Given an amount of money to convert to change. Write an algorithm that returns the optimal arrangement of change, that is, an array with the values of the coins returned to the user. The optimal array contains the least number of coins needed for the arrangement (think vending machine).
//
//You are given an unsorted array containing the numbers 1-100 inclusive and one additional random number.  Find the value of that number
//
//Given an array of integers, determine if the array is in sorted order.
//
//Sort an algorithm in n^2 time.  Attempt to write the algorithm from scratch
//
//Sort an algorithm in nlog(n) time.  Attempt to write the algorithm from scratch
//
//Given a non-negative int n, return the sum of its digits recursively (no loops). Note that mod (%) by 10 yields the rightmost digit (126 % 10 is 6), while divide (/) by 10 removes the rightmost digit (126 / 10 is 12).  (from http://codingbat.com/prob/p163932)
//
//Given two arrays of integers, compute the pair of values (one value in each array) with the smallest (non-negative) difference.  Return the difference. (from Cracking the Coding Interview p. 181)
//
//EXAMPLE:
//Input:{1,3,15,11,2},{23,127,235,19,8}
//Output: 3 (because 11-8=3)
//
//Design an algorithm to identify if a player has won a game of tic-tac-toe (from Cracking the Coding Interview p. 181)

