//
//  ViewController.swift
//  Serial API calls
//
//  Created by EOO61 on 20/09/21.
//

import UIKit

class ViewController: UIViewController {

    let group = DispatchGroup()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.serialAPICall()
    }

    func serialAPICall() {
        
        //API call 1
        let apiCall1BlockOperation = BlockOperation()
        apiCall1BlockOperation.addExecutionBlock {
            
            self.getAPICallExample1()
        }
        
        //API call 2
        let apiCall2BlockOperation = BlockOperation()
        apiCall2BlockOperation.addExecutionBlock {
            
            // enter the dispatch group
            self.group.enter()
            self.getAPICallExample2() //in this method I wrote code for // leaving the block i.e group.leave()
            
            // we need to wait for an entire execution block to complete
            self.group.wait()
        }
        
        //API call 3
        let apiCall3BlockOperation = BlockOperation()
        apiCall3BlockOperation.addExecutionBlock {
            
            // call API
            self.group.enter()
            self.getAPICallExample3()
            self.group.wait()
        }
        
        
        apiCall2BlockOperation.addDependency(apiCall3BlockOperation)
        apiCall1BlockOperation.addDependency(apiCall2BlockOperation)
        
        let operationQueue = OperationQueue()
        operationQueue.addOperation(apiCall1BlockOperation)
        operationQueue.addOperation(apiCall2BlockOperation)
        operationQueue.addOperation(apiCall3BlockOperation)
        
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
                
                self.group.leave()
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
                
                self.group.leave()
               // print("JSON Response: \(jsonResponse)") //Response result
                print("-------------------------------API Call 3 Execution Finished-----------------------")
                
             } catch let parsingError {
                print("Error", parsingError)
           }
        }
        task.resume()
        
    }
}

