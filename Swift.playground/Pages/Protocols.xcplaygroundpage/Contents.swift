//: [Previous](@previous)

import Foundation
import UIKit

///Associated Types:
///Associated types are a powerful way of making protocols generic

protocol ItemStoring {
    associatedtype DataType
    var items: [DataType] { get set }
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

protocol AutoMockable { //can be adopted by anyone, class, enum, struct
    func somethingClicked()
}

struct ControllerClass: AutoMockable {
    
//    weak var delegate: AutoMockable!
    func somethingClicked() {
        
    }
    
    
}
protocol AddsMoreCommands: class { //can be only adopted by class types
    // Code
}

extension AddsMoreCommands where Self: UIViewController { //can only be adopted by UIViewController Types
    // Code
}
//same as
protocol AddsMoreCommands2: UIViewController { //can only be adopted by UIViewController Types
    // Code
}
class abcd:UIViewController, AddsMoreCommands2 {
    
}

// extension of protocol '' cannot have an inheritance clause
extension AddsMoreCommands : AutoMockable {
    
}

/*
 Method returning Protocol
 
 */
func doSomething() -> Equatable {
    
}
//: [Next](@next)
