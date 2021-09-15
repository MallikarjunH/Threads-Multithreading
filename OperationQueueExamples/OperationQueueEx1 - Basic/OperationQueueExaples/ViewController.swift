//
//  ViewController.swift
//  OperationQueueExaples
//
//  Created by EOO61 on 14/09/21.
//
// More Details - https://ali-akhtar.medium.com/concurrency-in-swift-operations-and-operation-queue-part-3-a108fbe27d61



import UIKit

class ViewController: UIViewController {

    let queue = OperationQueue()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func example1ButtonAction(_ sender: Any) {
        
        //Following line - You can define how many operation you wants to perform at a time
        queue.maxConcurrentOperationCount = 1 // This is most imp line, if you dont write this, tasks will not execute sequntially, that you wrote or the sequence order you want to call/run the tasks
        // I wrote = 1 because, I wants to execute 1 task at a time
        
        
       // Operation objects execute in a synchronous manner by default — that is, they perform their task in the thread that calls their start method.
        
        //Task 1
        let task1 = BlockOperation {
            print("Task 1 Executed")
        }
        //Task 2
        let task2 = BlockOperation {
            print("Task 2 Executed")
        }
        
        //Task 3
        let task3 = BlockOperation {
            print("Task 3 Executed")
        }
        
        //Adding all tasks in a queues - Way 1
       // queue.addOperation { task1 }
       // queue.addOperation { task2 }
       // queue.addOperation { task3 }
        
        //Adding all tasks in a queues - Way 2
        queue.addOperations([task1,task2,task3], waitUntilFinished: true)
        
        task1.start() //optional - check it once
        task2.start() //optional - check it once
        task3.start() //optional - check it once
        
        print("End of example1 ButtonAction method call")
    }
    
    
    //Task Dependency
    //waitUntilFinished = true -> Blocks execution of the current thread until the operation object finishes its task
    //waitUntilFinished =  false -> If you don’t want to block the current thread which is main we assign it with false
    
    @IBAction func example2ButtonAction(_ sender: Any) {
        
         queue.maxConcurrentOperationCount = 1
      //  queue.maxConcurrentOperationCount = 5 //this case u have to make waitUntilFinished: false
        
        //Task 1
        let task1 = BlockOperation {
            print("Task 1 Executed")
        }
        //Task 2
        let task2 = BlockOperation {
            print("Task 2 Executed")
        }
        
        //Task 3
        let task3 = BlockOperation {
            print("Task 3 Executed")
        }
        
        //Task 4
        let task4 = BlockOperation {
            print("Task 4 Executed")
        }
        
        //Task 5
        let task5 = BlockOperation {
            print("Task 5 Executed")
        }
        
        task5.addDependency(task1) // In this case, task 1 will try to execute, but it wont exrecute task 1 because, Task 1 having dependency to task 2 so, Task 2 will be executed first then it will execute Task 1
        task1.addDependency(task2) // Task 2 will execute first, then it will execute Task 1
        task3.addDependency(task4) // Task 4 will execute first, then it will execute Task 3
        
        //Adding all tasks in a queues
       // queue.addOperations([task1,task2,task3,task4], waitUntilFinished: true) //waitUntilFinished: false
        queue.addOperations([task1,task2,task3,task4,task5], waitUntilFinished: true) // waitUntilFinished: true = It will execute 1 task at a time, it will block operations
        
        print("End of example2 ButtonAction method call")
    }
    
    @IBAction func example3ButtonAction(_ sender: Any) {
        
      //  queue.maxConcurrentOperationCount = 1
        
        print("End of example 3 ButtonAction method call")
    }
}

