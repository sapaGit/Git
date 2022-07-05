import UIKit

var greeting = "Hello, playground"

let firstArray = ["January", "February", "March"]

let charArray: [Character] = ["x", "1", "!", "B"]
let floatArray: Array<Float> = [12.4, 14.001, -1.9]

var mutArray = [true, false, false]
mutArray.append(false)
mutArray += [true, true]

var emptyArray = [Int]()
var emptyArray2: [Int] = []

let intArray = [492, 11, -13]
emptyArray += intArray
emptyArray

emptyArray[1]
emptyArray[0] + emptyArray[2]

emptyArray[1] = -20
emptyArray

var someArray = emptyArray

let someTuple = (1, 2, 3)

someArray.count
someArray.insert(729, at: 2)

someArray.remove(at: 1)
someArray

var arrayOfInt = [1, 2, 3, 4, 5, 6]
arrayOfInt[0...2]
let newArrayOfInt = arrayOfInt[3...5]

arrayOfInt[2...4] = [8]
arrayOfInt

arrayOfInt[arrayOfInt.count-4...arrayOfInt.count-1]

arrayOfInt.last
arrayOfInt.isEmpty
arrayOfInt.max()
arrayOfInt.min()
arrayOfInt.randomElement()
arrayOfInt.removeFirst()
arrayOfInt.removeLast()
arrayOfInt
arrayOfInt.removeAll()
arrayOfInt

type(of: arrayOfInt.min())

let repeatStringArray = Array(repeating: "Hi", count: 4)

let repeatCharArray = [Character](repeating: "🦔", count: 3)

if repeatStringArray == ["Hi", "Hi", "Hi", "Hi"] {
        print("Equal")
    } else {
        print("Not equal")
}
    

let arrayOfBool = [true, false, true]
for value in arrayOfBool {
    if value {
        print("Hi")
    } else {
        print("Hello")
    }
}

let arrayOfArrays = [["a", "b"], ["c","d"]]
arrayOfArrays[0][1]

arrayOfBool.suffix(from: 1)


