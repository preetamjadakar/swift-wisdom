//: [Previous](@previous)               [Next](@next)

//: Passing closures as parameter
import Foundation

func stringify(val1: String, val2: Int) -> String {
    return val1 + "\(val2)"
}

func usesStringFactory(stringFunc: (String, Int) -> String) -> String {
    return stringFunc("Number :", 11)
}
let aFunc: (String, Int) -> String = stringify

print(usesStringFactory(stringFunc: stringify(val1:val2:)))
print(usesStringFactory(stringFunc: aFunc))

//: Type Aliases for closure types

typealias CombinedToStrings = (String, Int)->String
func usesStringFactory1(stringFunc: CombinedToStrings) -> String {
    return stringFunc("Number :", 12)
}
print(usesStringFactory1(stringFunc: aFunc))
/*:
 # Higher Order functions
 + Takes one or more closure/function and returns one or more closure/functions
 + Used to make code more readable, efficient and easy to maintain
 */

//: sort vs sorted()
var names = ["preetam", "ravi", "sagar", "Akash"]
names.sort() // Here names has become a mutating var
print(names)
names.sort(by: <)
//: *<* is equivalent of (String, String) -> Bool as its a function name (func <)

let names2 = ["preetam", "ravi", "sagar", "Akash"]
names2.sorted() // sorted() has a return-type and its not mutating the caller
print(names2)

//: for-each
names.forEach { (name) in
    print(name)
}

names.enumerated().forEach { (tuple) in
    print(tuple.offset, tuple.element)
}
names.enumerated().forEach { (tuple) in
    let (offset, element) = tuple
    print(offset, element)
}
names.enumerated().forEach { (offset, element) in
    print(offset, element)
}

/*: Map:
 + Consider when, you have a collection and need a procesed collection of same size, i.e. mapping a element
 + Returns [T]
 */
let lenghtArray = names.map { (name) -> Int in
    return name.count
}

/*: Filter:
 + Filters out item from collection
 + Returns same as collection
 */
let filteredNames = names.filter { (name) -> Bool in
    return name.hasPrefix("p")
}


/*: CompactMap:
 + Combines Map and Filter
 + Returns non-nil for filtered out elements
 */
let compactedNames = names.compactMap { (name) -> Bool? in
//    return name.hasPrefix("p") ? name : nil
    return name.count > 4 ? true : nil
}
print(compactedNames)

/*: FlatMap: **Deprecated*
 + Combines Map and Filter
 + Returns optional
 */
let flatnedNames = names.flatMap { (name) -> Bool? in
    return name.count > 4 ? true : nil
}
print(compactedNames)

/*: Reduce:
 + Takes a collection and returns a single value result
 + Iterates a one more time extra than a collection count
 */
let reducedResult = names.reduce("Hello ") { (ongoing, val1) -> String in
    return ongoing + val1
}
print(reducedResult)

let totalLength = names.reduce(0) { (ongoing, val1) -> Int in
    return ongoing + val1.count
}

print(totalLength)

/*:
 # Passing function as parameter
 */

func longerThan4(val1: String) -> Bool {
    return val1.count > 4
}

let longerNames = names.first(where: longerThan4(val1:))
print(longerNames ?? "no value")

//: Higher order functions gives unexpected result on set
//: [Previous](@previous)               [Next](@next)
