//
//  APICallExample.swift
//  SerialQueue
//
//  Created by EOO61 on 20/09/21.
//

//https://medium.com/@prasanna.aithal/multi-threading-in-ios-using-swift-82f3601f171c
//https://www.avanderlee.com/swift/concurrent-serial-dispatchqueue/

/*
 
 API 1 - https://jsonplaceholder.typicode.com/todos
 API 2 - http://182.72.79.154/iphonetest/getTheData.php
 API 3 - https://jsonplaceholder.typicode.com/posts
 
 */


import UIKit

class APICallExample: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func callMultipleAPIs(_ sender: Any) {
        
       // dispatch_queue_t serialQueue = dispatch_queue_create("com.blah.queue", DISPATCH_QUEUE_SERIAL);
        
        let queue = DispatchQueue(label: "swiftlee.serial.queue")
         
        queue.sync() {
            print("--------------API Call 1 Execution Started---------------------------")
            self.getAPICallExample1()
        }
         
        queue.sync() {
            print("--------------API Call 2 Execution Started---------------------------")
            self.getAPICallExample2()
        }

        queue.sync() {
            print("--------------API Call 3 Execution Started---------------------------")
            self.getAPICallExample3()
        }
    }
    
    func getAPICallExample1(){
        
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/todos") else {return}
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
        guard let dataResponse = data,
                  error == nil else {
                  print(error?.localizedDescription ?? "Response Error")
                  return }
            do{
                //here dataResponse received from a network request
                let jsonResponse = try JSONSerialization.jsonObject(with:
                                       dataResponse, options: [])
                
               // print("JSON Response: \(jsonResponse)") //Response result
                print("-------------------------------API Call 1 Execution Finished-----------------------")
                
             } catch let parsingError {
                print("Error", parsingError)
           }
        }
        task.resume()
        
    }
    
    func getAPICallExample2(){
        
        guard let url = URL(string: "http://182.72.79.154/iphonetest/getTheData.php") else {return}
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
        guard let dataResponse = data,
                  error == nil else {
                  print(error?.localizedDescription ?? "Response Error")
                  return }
            do{
                //here dataResponse received from a network request
                let jsonResponse = try JSONSerialization.jsonObject(with:
                                       dataResponse, options: [])
                
                //print("JSON Response: \(jsonResponse)") //Response result
                print("-------------------------------API Call 2 Execution Finished-----------------------")
                
             } catch let parsingError {
                print("Error", parsingError)
           }
        }
        task.resume()
        
    }
    
    func getAPICallExample3(){
        
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/posts") else {return}
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
        guard let dataResponse = data,
                  error == nil else {
                  print(error?.localizedDescription ?? "Response Error")
                  return }
            do{
                //here dataResponse received from a network request
                let jsonResponse = try JSONSerialization.jsonObject(with:
                                       dataResponse, options: [])
                
               // print("JSON Response: \(jsonResponse)") //Response result
                print("-------------------------------API Call 3 Execution Finished-----------------------")
                
             } catch let parsingError {
                print("Error", parsingError)
           }
        }
        task.resume()
        
    }
}
