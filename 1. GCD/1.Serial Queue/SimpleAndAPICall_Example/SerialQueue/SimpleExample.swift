//
//  SimpleExample.swift
//  SerialQueue
//
//  Created by EOO61 on 20/09/21.
//

import UIKit

class SimpleExample: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        self.serialQueueTest()
    }
    
    // Serial Queue (private queue)
    // These are queues that, no matter whether you submit synchronous or asynchronous tasks to them, will always execute their tasks in a first-in-first-out (FIFO) fashion, meaning that they can only execute one block object at a time.
     
     
     func printCandies(){
         
         for i in 0..<3 {
             print("\(i) => Candy")
         }
     }
     
     func printApples(){
         for i in 0..<3 {
             print("\(i) => Apple")
         }
     }
     
     func serialQueueTest(){
        let queue = DispatchQueue(label: "com.knowstack.queue1")
         
        queue.async {
           self.printCandies()
        }
         
       // queue.async {
          //self.printStrawberries()
       // }
         
        queue.async {
           self.printApples()
        }
     }

}
