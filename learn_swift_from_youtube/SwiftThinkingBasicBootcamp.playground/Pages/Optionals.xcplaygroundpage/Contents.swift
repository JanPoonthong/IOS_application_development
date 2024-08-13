import Foundation

var otherBool: Bool? = nil

print(otherBool)
otherBool = false
print(otherBool)
otherBool = true
print(otherBool)
otherBool = nil
print(otherBool)

var a: String? = "H"

if let newValue = a {
    print(newValue)
} else {
    print(a)
}

func b() {
    guard let newValue = a else {
        print("H")
        return
    }
    
    print("D")
}
b()
