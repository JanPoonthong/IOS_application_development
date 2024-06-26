import UIKit

var greeting = "Hello, playground"
let name: String = "Jan"

greeting = "Hello, \(name)"

let n1: Int = 6
let n2: Int = 18

var result = ""

let d1: Double =  2.5
result = "The result is \(Double(n1) / d1)"

print("The result is: \(result)")


let b1: Bool = true
if b1 {
    print("B1 is true")
} else {
    print("B2 is false")
}

for i in 1...10 {
    print(i)
}

var arr: [String] = ["Jan", "Tom", "Jerry"]
for name in arr {
    print("Hello, \(name)")
}


var t1: [(String, Int)] = [("Jan", 20), ("Ton", 21), ("Jerry", 22), ("Ki", 32)]

for person in t1 {
    let message = String(format: "%@ %d", person.0, person.1)
    print(message)
}

typealias Jan = String
let message: Jan = "Hello"
print(message)

var i = 0
while i < 3 {
    print("While loop \(i)")
    i += 1
}

class Student {
    var name: String = ""
    var id: String = ""
    var totalGpa: Double = 0.0
    var totalCredit: Int = 0
    
    init(name: String, id: String, totalGpa: Double, totalCredit: Int) {
        self.name = name
        self.id = id
        self.totalGpa = totalGpa
        self.totalCredit = totalCredit
    }
    
    func detailPrint() {
        print("\(id) \(name) GPA: \(totalGpa) Credit: \(totalGpa)")
    }
}

let s1 = Student(name: "Jan", id: "u6511286", totalGpa: 3.0, totalCredit: 66)

print(s1.name)
print(s1.id)
print(s1.totalGpa)
s1.name = "Tom"
print(s1.name)
s1.detailPrint()

// Optional Type for Type Safety
var number: Int? = nil;
number = 10
number = nil

if number != nil {
    var calculationResult = number! + 2
}

if let numberAferCheck = number {
    var calculationResult = numberAferCheck + 2
}

func guardDemo() {
    guard let numberCheckedByGuard = number else {
        return
    }
    print(numberCheckedByGuard + 2)
}

guardDemo()

func calculate(n1: Int, n2: Int) -> (String, Int) {
    return ("reuslt is ok", n1 + n2)
}

var returnValue = calculate(n1: 1, n2: 2)
print(returnValue)
