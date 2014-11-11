// Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"



// ----------------------------------------------------------
// Singleton Pattern 1
// usage: MyClass.instance.myMethod()
// ----------------------------------------------------------
class MyClass {
    
    func myMethod() { println("myMethod") }

    struct Static {
        static var token : dispatch_once_t = 0
        static var instance : MyClass?
    }

    class var instance: MyClass {
        dispatch_once(&Static.token) {  Static.instance = MyClass() }
        return Static.instance!
    }

    init(){
        assert(Static.instance == nil, "Singleton instance already initialized!")
    }
}

// ----------------------------------------------------------
// Singleton Pattern 2
// usage: let instance = SingletonClass.shared
// ----------------------------------------------------------
class SingletonClass {
    class var shared : SingletonClass {
        
        struct Static {
            static let instance : SingletonClass = SingletonClass()
        }
        
        return Static.instance
    }
}



