//: [Previous](@previous)
import UIKit
import Foundation
/*:
 # What's new in iOS15
 - All-new FaceTime that even works with Android!
 - Drag and Drop across apps on iOS 15
 - Apple Wallet can now actually let you leave your physical-wallet at home
    - While the Wallet app on the iPhone could already store a digital key for your car, it can now do much more including unlocking your house door or even storing access cards to unlock your office doors and even your hotel room when you’re on vacation. Apple’s aim is to completely eliminate the need for a separate wallet and allow you to have everything you need on your iPhone.
 - Live Text:
    - already offered by Google Lens but the difference here is Live Text processes information on-device which means it’s more secure and works even without an internet connection. Not just text, but you can also scan animals or objects and look them up.
 - Revamped Notifications (sorta)
 - All-new FaceTime that even works with Android!
 - Focus Modes for better Work-life Balance
 - New Weather animations: `Dark Sky`(leader in weather apps) acquisition finally pays off
 - Different Mic Modes: Voice Isolation and Wide Spectrum
 - Sharing gets easier through iMessage on iOS 15
 - Slightly revamped Settings app
 - Rich Results in Spotlight Search
 - Big changes in Safari
    - The biggest change however is the ability to install extensions on Safari which isn’t possible on some other popular mobile browsers like Google Chrome.
 - Miscellaneous Changes in iOS 15: Photos, Siri, and Privacy Reports
 */

/*:
 # What's new in Swift 5.5
 - Result enum: failure, success
 -
 # Async await
    
         func getSomeData(value: String) async -> [String] {
         
         }
 let data = await getSomeData(value:"asd")  ==> Caller must be async if not use Task { }
 
 # Async sequences
 # Effectful read-only properties
 
     enum FileError {
         case missing, unreadable
     }
     struct BundleFile {
         let fileName: String
         
         var contents: String {
             get async throws {
                 guard let url = Bundle.main.url(forResource: fileName, withExtension: nil) else {
                     throw FileError.missing
                 }
                 do {
                    return try String.contains(fileName)
                 } catch  {
                     throw FileError.unreadable
                 }
             }
         }
     }
 
/// try await file.content
 
 Structured concurrency
 async let bindings
 Continuations for interfacing async tasks with synchronous code
 Actors
 Global actors
 Sendable and @Sendable closures
 if for postfix member expressions
 Allow interchangeable use of CGFloat and Double types
 Codable synthesis for enums with associated values
 lazy now works in local contexts
 Extend property wrappers to function and closure parameters
 Extending static member lookup in generic contexts
 */


//: [Next](@next)
