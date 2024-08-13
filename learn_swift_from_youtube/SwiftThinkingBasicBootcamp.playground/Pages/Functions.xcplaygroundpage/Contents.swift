func doSomething() {
    let title: String = "Hello"
    
    guard title != "Hello" else {
        print("Bye")
        return
    }
    print("Hello")
}

doSomething()
