import UIKit

///Associated Types:
///Associated types are a powerful way of making protocols generic

protocol ItemStoring {
    associatedtype DataType
    var items: [DataType] { get set}
    mutating func add(item: DataType)
}

extension ItemStoring {
    mutating func add(item: DataType) {
        items.append(item)
    }
}

struct NameDatabase: ItemStoring {
    var items = [String]()
}
struct ValueDatabase: ItemStoring {
    var items = [Int]()
}

var names = NameDatabase()
names.add(item: "James")
names.add(item: "Jess")

print(names)

var values = ValueDatabase()
values.add(item: 2)
values.add(item: 4)
print(values)

///static VS class functions
///class functions can be overriden unlike static
///static is same as class final
///In case of static functions, if we access one of the static member, entire class gets loaded in memory. But in case of global function, only that particular function will be loaded in memory.


///Hashable

let valuesSet = Set<Int>(arrayLiteral: 1, 2, 2,3)
print(valuesSet.count)
struct Student {
    let name: String
    let id: Int
}

extension Student: Equatable {
}
extension Student: Hashable {
}


///

/*:
 # Lazy Vs Computed
 - We should be really writing an optimised code which consider memory allocation at first place. The developer need to avoid doing expensive work unless it’s really needed.
 - Swift has a mechanism built right into the language that enables just-in-time calculation of expensive work, and it is called a lazy variable. These variables are created using a function you specify only when that variable is first requested. If it’s never requested, the function is never run, so it does help save processing time.
 - Note: Remember, the point of lazy properties is that they are computed only when they are first needed, after which their value is saved. So, if you call the lazy property for the second time, the previously saved value is returned.
 - Important to note: You can use self inside the closure of a lazy property. It will not cause any retain cycles. The reason is that the immediately applied closure {}() is considered @noescape. It does not retain the captured self.
 - We can use lazy only with members of **struct** and **class.**
*/
struct LazyTest {
    var name: String
    lazy var greetings: String = {
        return "Hello \(self.name), " + appendedString
    }()
    
    lazy var appendedString: String = "I'm iOS developer"
    init(name: String) {
        self.name = name
    }
}

var lazyTest = LazyTest.init(name: "Preetam")
//lazyTest.appendedString
//lazyTest.greetings
lazyTest.greetings
lazyTest.appendedString

/*:
 # Stored Vs Computed properties
 + Stored properties are used to store constant and variable values as part of an instance, whereas computed properties calculate (rather than store) a value.
 - Computed properties are provided by classes, structures, and enumerations.
 - Stored properties are provided only by classes and structures.
 eg: lazy var abcd = { return "" }() is a variable stored property and executed once hence not a computed property
 */

/*:
    # Optional Binding:
 - Other than forced unwrapping, optional binding is a simpler and recommended way to unwrap an optional. You use optional binding to check if the optional contains a value or not.

 if let stock = findStockCode("Apple") {
     if let sharePrice = stock.price {
         let totalCost = sharePrice * 100
         println(totalCost)
     }
 }
 
 # Optional Chaining:
 -  Instead of writing nested “if set”, you can simplify the code by using Optional Chaining. The feature allows us to chain multiple optionals together with the “?.”
 
 if let sharePrice = findStockCode("Apple")?.price {
     let totalCost = sharePrice * 100
     println(totalCost)
 }
 */

///Closures are self-contained blocks of functionality that can be passed around and used in your code. — Apple

// Closure take no parameter and return nothing
let sayHello: () -> Void = {
    print("Hello")
}

sayHello()

// Closure take one parameter and return 1 parameter
let value: (Int) -> Int = { (value1) in
    return value1
}

print(value(5))

// Closure take two parameter and return 1 parameter
let add: (Int, Int) -> Int = { (value1, value2) in
    return value1 + value2
}

print(add(5, 4))

// Closure take two parameter and return String parameter
let addValues: (Int, Int) -> String = { (value1, value2) in
    return String("Sum is: \(value1 + value2)")
}

print(addValues(5, 4))

///Closure as an argument to method call

func makeSquare(of number:Int, completion: (Int)->Void) {
    let square = number * number
    completion(square)
}

makeSquare(of: 5) { (result) in
    print(result)
}


///Non-escaping Closures: By Default

///When you are passing a closure as the function argument, the closure gets execute with the function’s body and returns the compiler back. As the execution ends, the passed closure goes out of scope and have no more existence in memory.


/// POP: Protocol Oriented Programing
protocol CanBark {
    func bark()
}
protocol CanWaggTail {
    func waggTail()
}
struct Dog {
    
    // Protocol Composition
    typealias Dependency = CanBark & CanWaggTail
    
    let dogManager: Dependency
    
    func ballFound() {
        dogManager.waggTail()
        dogManager.bark()
    }
}
/*----- Another Way! -----*/
// Protocol Composition
protocol CanDoDogThings: CanBark, CanWaggTail {
    
}
struct Dog2 {
    let dogManager: CanDoDogThings
    
    func ballFound() {
        dogManager.waggTail()
        dogManager.bark()
    }
}



let numbers = [4, 5, 6, 7, 8]
numbers.forEach { (number) in
    print(number)
    if number > 5 {
      //  break/continue NOT ALLOWED
    }
}
let evenNumbers = (0...100).filter { number -> Bool in
//    print("loop") // excutes till 100
    return number % 2 == 0
}.prefix(10) //

print(evenNumbers)

func rollDice() -> Int {
    return (1...6).randomElement()!
}

let maxTries = 6
var tries = 0
var score = 0

while tries < maxTries {
    score += rollDice()
    tries += 1
}

print("Total score is \(score)") // Everytime a random new score!

repeat {
    score += rollDice()
    tries += 1
} while tries < maxTries

print("Total score is \(score)")

/*:
 Control transfer statements break, continue, fall through, return and throw.

 */
