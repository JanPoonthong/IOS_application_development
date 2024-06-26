import UIKit

var greeting = "Hello, playground"

var explicitText: String = "Hello"
var implicitText = "Hello"

var name: String? = "Jan"
print(name ?? "No value")

var totalScore: Int? = 100
//if totalScore != nil {
//    totalScore! += 10
//    print(totalScore!)
//}

if var totalScore = totalScore, var name = name {
    totalScore += 100
    print("Name: " + name)
    print("Score: \(totalScore)")
}

if let _ = name {
    print("The name is not nil")
} else {
    print("The name is nil")
}
