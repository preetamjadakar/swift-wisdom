//: [Previous](@previous)


/*:
 URLSession is the successor of NSURLConnection
 URLSession is the key object responsible for sending and receiving requests. You create it via URLSessionConfiguration, which comes in three flavors:

 #default:
    - Creates a default configuration object that uses the disk-persisted global cache, credential and cookie storage objects.
 #ephemeral:
    - Similar to the default configuration, except that you store all of the session-related data in memory. Think of this as a “private” session.
 # background:
    - Lets the session perform upload or download tasks in the background.
    # Transfers continue even when the app itself is suspended or terminated by the system.
 
 URLSessionTask is an abstract class that denotes a task object. A session creates one or more tasks to do the actual work of fetching data and downloading or uploading files.
 There are three types of concrete session tasks:

 #URLSessionDataTask:
    - Use this task for GET requests to retrieve data from servers to memory.
 #URLSessionUploadTask:
    - Use this task to upload a file from disk to a web service via a POST or PUT method.
 #URLSessionDownloadTask:
    - Use this task to download a file from a remote service to a temporary file location.

 You can also suspend, resume and cancel tasks. URLSessionDownloadTask has the extra ability to pause for future resumption.
 
 - Canel: downloadTask.cancel()
 - Pausing a download is similar to canceling it. Pausing cancels the download task, but also produces resume data, which contains enough information to resume the download at a later time if the host server supports that functionality.
 
     download.task?.cancel(byProducingResumeData: { data in
       download.resumeData = data
     })
 
 - The OS runs a separate daemon outside the app to manage background transfer tasks, and it sends the appropriate delegate messages to the app as the download tasks run. In the event that the app terminates during an active transfer, the tasks will continue to run, unaffected, in the background.

 - When a task completes, the daemon will relaunch the app in the background. The relaunched app will recreate the background session to receive the relevant completion delegate messages and perform any required actions, such as persisting downloaded files to disk.

 let configuration =
   URLSessionConfiguration.background(withIdentifier:
                                        "com.raywenderlich.HalfTunes.bgSession")
 
 Note: You must not create more than one session for a background configuration, because the system uses the configuration’s identifier to associate tasks with the session.
 
 #Relaunching Your App
 If a background task completes when the app isn’t running, the app will relaunch in the background. You’ll need to handle this event from your app delegate.

     -  func application( _ application: UIApplication, handleEventsForBackgroundURLSession   handleEventsForBackgroundURLSessionidentifier: String, completionHandler: @escaping () -> Void) {
            backgroundSessionCompletionHandler = completionHandler
        }
 
 The place to invoke the provided completion handler is urlSessionDidFinishEvents(forBackgroundURLSession:), which is a URLSessionDelegate method that fires when all tasks on the background session have finished.
 
         func urlSessionDidFinishEvents(forBackgroundURLSession session: URLSession) {
             DispatchQueue.main.async {
               if let appDelegate = UIApplication.shared.delegate as? AppDelegate,
                 let completionHandler = appDelegate.backgroundSessionCompletionHandler {
                 appDelegate.backgroundSessionCompletionHandler = nil
                 
                 completionHandler()
               }
             }
           }
 */
//
import Foundation
import UIKit

var str = "Hello, playground"
// Obtain Reference to Shared Session
let sharedSession = URLSession.shared

if let url = URL(string: "https://goo.gl/wV9G4I") {
    // Create Request
    let request = URLRequest(url: url)

    // Create Data Task
    let dataTask = sharedSession.dataTask(with: request, completionHandler: { (data, response, error) -> Void in
        if let data = data, let _ = UIImage(data: data) {
            DispatchQueue.main.async {
//                self.imageView.image = image
            }
        }
    })
    
    dataTask.resume()

}
//: [Next](@next)
