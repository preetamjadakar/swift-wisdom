//: [Previous](@previous)

import Foundation
import UIKit

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
//: [Next](@next)
