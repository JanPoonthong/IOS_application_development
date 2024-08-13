import Foundation

func a() -> String {
    return "A"
}

func b() -> String {
    return "B"
}

func main(info: ((name: String, hello: String))) -> (name: String, hello: String) {
    let c = a()
    let d = b()
    
    return (c, d)
}
var asd = main(info: (a(), b()))
print(asd.name)
