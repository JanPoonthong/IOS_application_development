import Foundation

struct Quiz {
    let title: String
    let dateCreated: Date
}

var myObject: String = "Hello, World"

var myQuiz: Quiz = Quiz(title: "Quiz 1", dateCreated: .now)

print(myQuiz.title)
