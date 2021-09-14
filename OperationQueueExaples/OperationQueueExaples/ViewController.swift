//
//  ViewController.swift
//  OperationQueueExaples
//
//  Created by EOO61 on 14/09/21.
//

import UIKit

class ViewController: UIViewController {

    let queue = OperationQueue()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func example1ButtonAction(_ sender: Any) {
        
        queue.maxConcurrentOperationCount = 1
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
        
        task1.start()
        task2.start()
        task3.start()
        
        print("End of the code")
    }
    
}

