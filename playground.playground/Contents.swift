import UIKit
import Foundation

/// String duplicate, get first non-duplicated letter
var string = "ruud van nistelrooy"

string = string.replacingOccurrences(of: " ", with: "")
print(string)

var stringArr = Array(string)
print(stringArr)

let group = Dictionary(grouping: stringArr, by: {$0})
print(group)

let duplicates = Dictionary(grouping: stringArr, by: {$0}).filter { $1.count > 1}.keys

print(duplicates)

let final = stringArr.filter({ !duplicates.contains($0)})
if let answer = final.first {
    print(answer) // first of non duplicated letter, "d"
}

/// sort without using sort function
var unsortedArr = [3,4,6,1,9,7,5]

func sort() {
    for index in 0..<unsortedArr.count where index < unsortedArr.count-1 {
        if unsortedArr[index] > unsortedArr[index+1] {
            let num = unsortedArr[index]
            unsortedArr.remove(at: index)
            unsortedArr.insert(num, at: index+1)
        }
    }
}

for _ in 1...unsortedArr.count {
    sort()
}
print(unsortedArr) // 1,3,4,5,6,7,9

/// reverese the whole letter without using reverse
let name = "bumblebee"

var nameArr = Array(name)
//nameArr.reverse()
//print(String(nameArr))

var reverseArr: [String] = []
var reverseStr = ""

for elem in nameArr {
    reverseArr.insert(String(elem), at: 0)
//    reverseStr += reverseArr
}

for elem in reverseArr {
    reverseStr += elem
}

print(reverseStr) // eebelbmub


/// Find duplicated letter
var str1 = "toyota"
let str2 = "honda"

str1+=str2
let strArr = Array(str1)

let group = Dictionary(grouping: strArr, by: {$0}).filter({ $1.count > 1 }).keys
print(group) // o,t,a

for i in 0..<10 { //1...10 (1 to 10) 1..<10 (1 to 9) 0..<10 (0 to 9)
    print(i)
}


enum Stock {
    case qqq(price: Int)
    case spy
}

func invest(in stock: Stock) {
    switch stock {
    case .qqq(let price) where price < 300:
        print("invest qqq for \(price)")
//    default:
    case .qqq, .spy:
        print("no invest at all")
    }
}

invest(in: .qqq(price: 399))

struct Stock {
    var name: String
    var price: Float
    var etf: Bool
}

var qqq = Stock(name: "qqq", price: 300, etf: true)
var spy = Stock(name: "spy", price: 345, etf: true)
var aapl = Stock(name: "aapl", price: 122, etf: false)

let myStocks = [qqq, spy, aapl]

// filter, find relevant one
let etf = myStocks.filter({ return $0.etf })
print(etf)

// map, do math on all
let afterTax: [Float] = myStocks.map({ return $0.price * 0.3 })
print(afterTax)

// reduce, add total
let total = afterTax.reduce(0, +)
print(total)
