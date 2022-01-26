//: [Previous](@previous)

/*:
 ## What is memory management?
-  Memory refers to all the hardware involved in storing information on your device. Your iPhone has two main ways of storing data 1. the disk 2. Random Access Memory (RAM).
- When an app is run on your iPhone a file containing all executable instructions will be loaded into the RAM. At the same time the system will claim a chunk of the RAM, which is called the heap.
- This is the place where all instances of our classes will live while the app is running.
- When we talk about memory management we refer to the process of managing heap memory. This means managing the life cycles of objects on the heap and making sure that these objects are freed when they are no longer needed so the memory can be reused.
- In Objective-C aside from primitives like Int, CGRect etc. everything is an object and therefore will be allocated on the heap. In Swift reference types are allocated on the heap, but values types are not.
- Managing the heap memory is very important because objects can be large and our apps get only so much memory from the system. Running low on memory will cause an iOS App to run slower and eventually will make the app crash. Although nowadays it is getting more rare to see a RAM overload since our devices are getting more powerful its always important to be a good memory citizen.
- **autorelease** with which you declare that you don’t want to own an object beyond the scope in which you sent autorelease. It then gets added to the autoreleasepool, which when it gets drained sends release to all the objects in the pool. This usually happens when the current runloop ends but it can be sooner. So with autorelease you basically say “I want this instance to be released some time in the future”. Autorelease is very handy when you are passing instances around in your code, for example when you have a method that creates and returns an instance of a class you can use autorelease to make the caller responsible for managing its memory.
 
 
 ## Strong reference cycles(retain cycle)
 - So Swift does most of the memory management for us, Awesome! Does that mean we as developers don’t have to think about memory management anymore? The answer is no, because with ARC we always have to be careful not to create any strong reference cycles. You create a strong reference cycle when two instances of a class both hold strong references to each other. Because in this situation the reference count of those objects will never get to zero they will hold each other in memory until the application terminates. This is called a memory leak. Strong reference cycles are not always easy to find but a common pitfall is working with closures. This is best illustrated with an example.
 
 + In a MVVM design pattern viewModel is always a **strong instance**.
 
 - when a strong viewmodel trigers a strong call to the self in completion handler, it creates a retain cycle or memory leak.
 - to avoid this problem, we use **capture-list** and do specify self as weak/unowned.


override func viewDidLoad() {
    super.viewDidLoad()
    …
    viewModel.changeHandler = { [weak self] in
        self?.tableView.reloadData()
    }
}
 */
/*:
 Memory leak is a portion of memory that is occupied forever and never used again. This takes space and causes problems in the App.
 Retain cycle is nothing but memory leak where both objects are unable to make each other release.
 */

//: [Next](@next)
