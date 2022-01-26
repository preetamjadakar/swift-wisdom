import UIKit


/*:
 # Property Wrappers:
    - When dealing with properties that represent some form of state, it’s very common to have some kind of associated logic that gets triggered every time that a value is modified. For example, we might validate each new value according to a set of rules, we might transform our assigned values in some way, or we might be notifying a set of observers whenever a value was changed.
 
 
 */

@propertyWrapper struct Capitalized {
    var wrappedValue: String {
        didSet { wrappedValue = wrappedValue.capitalized }
    }
    
    init(wrappedValue: String) {
        self.wrappedValue = wrappedValue.capitalized
    }
}
/// Note how we need to explicitly capitalize any string that was passed into our initializer, since property observers are only triggered after a value or object was fully initialized.

struct User {
    @Capitalized var firstName: String
    @Capitalized var lastName: String
}

// John Appleseed
var user = User(firstName: "john", lastName: "appleseed")
print(user.firstName + user.lastName)
// John Sundell
user.lastName = "sundell"
print(user.lastName)

///Associated Types:
///Associated types are a powerful way of making protocols generic

protocol ItemStoring {
    associatedtype DataType
    var items: [DataType] { get set }
    var number: Int { get }
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

// Can we have a instance of class to be a member of structure? And what's the impact?
class TimePass {
    
}

struct MakingTimePass {
    var timePass = TimePass()
    
}

extension MakingTimePass {
    var number = Int()
}

///Hashable

let valuesSet = Set<Int>(arrayLiteral: 1, 2, 2,3)
print(valuesSet.count)
struct Student {
    let name: String
    let id: Int
}

extension Student: Equatable {
    static func == (lhs: Student, rhs: Student) -> Bool {
           return lhs.name == rhs.name &&
                   lhs.id == rhs.id
    }
}

let student1 = Student.init(name: "Preetam", id: 4)
let student2 = Student.init(name: "Preetam", id: 4)
let student3 = Student.init(name: "Mahesh", id: 4)
print(student1 == student2)
print(student1 == student3)
/*
 Easy enough, right?

 Well actually, it’s even easier than that — as of Swift 4.1, the compiler can automatically synthesize conformance for structures whose stored properties all have types that are Equatable. We could replace all of the code in the extension by simply adopting Equatable in the declaration of Binomen:
 */
struct Binomen: Equatable {
    let genus: String
    let species: String
}

let 🐺 = Binomen(genus: "Canis", species: "lupus")
let 🐻 = Binomen(genus: "Ursus", species: "arctos")
🐺 == 🐺 // true
🐺 == 🐻 // false

/// The Limits of Automatic Synthesis:
/// Tuples aren’t nominal types, so they can’t conform to Equatable.

struct iPad: Hashable {
    var serialNumber: String
    var capacity: Int
    func hash(into hasher: inout Hasher) {
        hasher.combine(serialNumber)
    }
}
/*:
 - From now on, a iPad instance can be a Dictionary key or a Set element.

 - Because that conforms to the Hashable protocol and both its properties also conform to the Hashable protocol, Swift will generate a hash(into:) method automatically.

 - However, in this case we can see that serialNumber is enough to identify each iPad uniquely so hashing capacity isn’t needed. So, we can write our own implementation of hash(into:) that hashes just that one property:
 */

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
 */

class Stock {
    var price:Int? = Int()
}
func findStockCode(_ company:String) -> Stock? {
    return Stock.init()
}

 if let stock = findStockCode("Apple") {
     if let sharePrice = stock.price {
         let totalCost = sharePrice * 100
         print(totalCost)
     }
 }
 /*:
  # Optional Chaining:
 -  Instead of writing nested “if let”, you can simplify the code by using Optional Chaining. The feature allows us to chain multiple optionals together with the “?.”
 */

 
 if let sharePrice = findStockCode("Apple")?.price {
     let totalCost = sharePrice * 100
     print(totalCost)
 }
 

///Closures are self-contained blocks of functionality that can be passed around and used in your code. — Apple

// Closure take no parameter and return nothing
let sayHello: () -> Void = { // typealiase Void = ()
    print("Hello")
}

sayHello()

//OR

let sayHello2 = {
    print("Hello2")
}

sayHello2()

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

func makeSquare(of number:Int, completion: @escaping(Int)->Void) {
    let square = number * number
    completion(square)
}

makeSquare(of: 5) { (result) in
    print(result)
}


///Non-escaping Closures: By Default

///When you are passing a closure as the function argument, the closure gets execute with the function’s body and returns the compiler back. As the execution ends, the passed closure goes out of scope and have no more existence in memory.
/*
 # @escaping and @nonescaping
 - An escaping closure is a closure that’s called after the function it was passed to returns. In other words, it outlives the function it was passed to.
 - A non-escaping closure is a closure that’s called within the function it was passed into, i.e. before it returns.
 */
var shoppingList = ["key":"value"]

// Initialize the dictionary
 func callSomeMethodWithParams(_ params: [AnyHashable: Any], onSuccess success: (_ JSON: Any) -> Void, onFailure failure:  (_ error: Error?, _ params: [AnyHashable: Any]) -> Void) {
    
    print("\n" + String(describing: params))
    
    let error: Error? = NSError(domain:"", code:1, userInfo:nil)

    var responseArray: [Any]?
    responseArray = [1,2,3,4,5]
    
    if let responseArr = responseArray {
        success(responseArr)
    }
    if let err = error {
        failure(err, params)
    }
}
callSomeMethodWithParams(shoppingList, onSuccess: { (JSON) in
    print("\nSuccess. Response received...: " + String(describing: JSON))
}) { (error, params) in
    if let err = error {
        print("\nError: " + err.localizedDescription)
    }
    print("\nParameters passed are: " + String(describing:params))
}


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
