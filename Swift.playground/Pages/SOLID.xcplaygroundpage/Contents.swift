//: [Previous](@previous)

///Though we can't precisly say what is GOOD Software design, we can identify what is the bad design.
/*
 SIGNS OF A BAD DESIGN:

 1. REGIDITY: Cascading the code changes
    Code changing needs lot more changes in the other part as well, such a system are hard/impossible to estimate(impact and cost)

 2. FRAGILITY: Fixing one problem creates new bugs in other part of the system

 3. IMMOBILITY: Hard to resuse due to tight coupling, reimplemetation comes in picture due to separation problem

 SOLID tries to address these threats.
 S => Single Object responsibilty
 O => Open-Close principle
 L => Liskov's substititution principle
 I => Interface segregation
 D => Dependancy inversion
*/
import UIKit

///Single Object Responsibility Principle tells us to have a each object/type should have single well defined responsibility
///CurrencyManager class has too many responsibilities
/*class CurrencyManager {
    func fetchRates(for sourceCorrency: String, targetCurrency: String, completion:(Error?, Double) -> Void) -> Void {
        //..
    }
    func save(rate: Double, for sourceCorrency: String, to targetCurrency: String) {
        //..
    }
    func loadRate(for sourceCorrency: String, to targetCurrency: String) -> Double {
        return 0
        //..
    }
    func convert(amount fromCurrency: String, toCurrency: String) -> Double {
        return 0
        //..
    }
}*/

///FIX:
class CurrencyManager {
    func convert(amount fromCurrency: String, toCurrency: String) -> Double {
        return 0
        //..
    }
}
class NetworkManager {
    func fetchRates(for sourceCorrency: String, targetCurrency: String, completion:(Error?, Double) -> Void) -> Void {
        //..
    }
}
class DatabaseManager {
    func save(rate: Double, for sourceCorrency: String, to targetCurrency: String) {
        //..
    }
    func loadRate(for sourceCorrency: String, to targetCurrency: String) -> Double {
        return 0
        //..
    }
}

///Open-Close Principle says, S/W entities should be open for extension and closed for modification, able to add new behaviour without modifying the existing code
///We achieve this using inheritance, composition and polimorphism
class Shape {
    func area() -> Double {
        return 0
    }
}
extension Shape: CustomStringConvertible {
    var description: String {
        return "base Shape Class"
    }
}

///Liskov Substitution Principle: Ability to replace references of base classes with the objects of derived classes
class Rectangle: Shape {
    private var l, w: Double
    init(length: Double, width: Double) {
        l = length
        w = width
    }
    override func area() -> Double {
        return l * w
    }
}
class Circle: Shape {
    private var r: Double
    init(radius: Double) {
        r = radius
    }
    override func area() -> Double {
        return .pi * r * r
    }
}
class Square: Shape {
    private var a: Double
    init(side: Double) {
        a = side
    }
    override func area() -> Double {
        return a * a
    }
}

var shapes = [Shape]()

let rectangle = Rectangle(length: 10, width: 12)
let square = Square(side: 10)
let circle = Circle(radius: 10)
shapes.append(rectangle)
shapes.append(square)
shapes.append(circle)
let totalArea = shapes.reduce(0, {$0 + $1.area()})
print(totalArea)


///Interface Segregation: deals with the 'fat' interfaces.
///Interfaces become fat as we keep on addition too may functionalities as we develope software as a result clients become dependednt on stuff that is not used.
/*
protocol ImageProcessing {
    var base64Encoded: String? { get }
    var jpegData: Data? { get }
    var pngData: Data? { get }
    init(data: Data)

    init(from url: URL) throws
    func save(to url: URL) throws
}
*/

///Solution
protocol ImageProcessing {
    var data: Data? { get }
    init(data: Data)
}

protocol Base64Encoding {
    var base64Encoded: String? { get }
}

protocol ImageEncoding {
    var jpegData: Data? { get }
    var pngData: Data? { get }
}

protocol ImagePersistance {
    func load(from url: URL) throws
    func save(to url: URL) throws
}
///Now, Use as per requirement


///Dependency Inversion deals with the resuability.
///High-level modules should not depend on low-level modules, instead **both** should depend on abstractions
///Abstrations should not depend on details but details should depend on abstraction

/*
 class Persistance {
 let logger: Logger()

 func saveData() {
    //do something
    //catch: log the error
 }
}
 class Logger {
    func log(message: String) {
        print("LOG: \(message)")
    }
 }
 */

//Here Persistance class is depend on Logger class
//FIX:

class Persistance {
 let logger: Logger?
    init(logger: Logger) {
        self.logger = logger
    }

 func saveData() {
    //do something
    //catch: log the error
 }
}
 protocol Logger {
    func log(message: String)
// {
//        print("LOG: \(message)")
//    }
 }

///Dependency Injection == ???Gimme it??? and Dependency Inversion == ???Someone take care of this for me, somehow.???
///Dependency injection is a discrete, code-level tactic. Dependency inversion is more of an architectural strategy and way of structuring (decoupling) code bases.
///Example: Dependency Injection
/*

 So instead of this:

 public Time getTheTime() {
     ThingThatTellsTime atom = new CesiumAtom();
     return atom.getMeTheTimeSomehow();
 }

 You say, ???nah, gimme it,??? and do this instead:

 public Time getTheTime(ThingThatTellsTime whatever) {
     return whatever.getMeTheTimeSomehow();
 }
 
 # Why Dependency Injection?
   - Dependency Injection relies on a principle called Inversion of Control. The main idea is that a piece of code that requires some dependencies won???t create them for itself, rather the control over providing these dependencies is deferred to some higher abstraction. These dependencies are typically passed into an object???s initializer. This is the opposite approach ??? an inverted approach ??? to the typical cascade of object creation: Object A creating Object B, creating Object C, and so on.

   - From a practical perspective, the main benefit of Inversion of Control is that code changes remain isolated. A Dependency Injection Container supports the Inversion of Control principal by providing an object that knows how to provide the dependencies for an object. All you need to do is ask the container for the object you need, and voil????? it???s ready!
 */

//: [Next](@next)
