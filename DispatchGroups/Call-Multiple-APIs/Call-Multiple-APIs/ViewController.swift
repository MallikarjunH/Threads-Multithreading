//
//  ViewController.swift
//  Call-Multiple-APIs
//
//  Created by EOO61 on 15/09/21.
// Sample API for Testing - https://reqres.in



import UIKit
import Alamofire

class ViewController: UIViewController {

    @IBOutlet weak var apiResponseHeading1: UILabel!
    @IBOutlet weak var apiResponseHeading2: UILabel!
    @IBOutlet weak var apiResponseHeading3: UILabel!
    
    @IBOutlet weak var apiResponseValu1: UILabel!
    @IBOutlet weak var apiResponseValu2: UILabel!
    @IBOutlet weak var apiResponseValu3: UILabel!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        self.apiResponseHeading1.isHidden = true
        self.apiResponseHeading2.isHidden = true
        self.apiResponseHeading3.isHidden = true
        self.apiResponseValu1.isHidden = true
        self.apiResponseValu2.isHidden = true
        self.apiResponseValu3.isHidden = true
    }


    @IBAction func callAPIButtonClicked(_ sender: Any) {
        
        //Create Object Of DispatchGroup
        let dispatchGroup = DispatchGroup()
        print("DispatchGroup is initialised")
        
        
        // TASK 1
        // Enter for first API
        dispatchGroup.enter()
        print("Task 1 Started: Dispatch group Is Entered")
        
        AF.request("https://jsonplaceholder.typicode.com/todos/1", parameters: nil, headers: nil).validate(statusCode: 200 ..< 299).responseJSON { AFdata in
            do {
                
                guard let jsonObject = try JSONSerialization.jsonObject(with: AFdata.data!) as? [String: Any] else {
                    print("Error: Cannot convert data to JSON object")
                    return
                }
                guard let prettyJsonData = try? JSONSerialization.data(withJSONObject: jsonObject, options: .prettyPrinted) else {
                    print("Error: Cannot convert JSON object to Pretty JSON data")
                    return
                }
                guard let prettyPrintedJson = String(data: prettyJsonData, encoding: .utf8) else {
                    print("Error: Could print JSON in String")
                    return
                }
                
               // print(prettyPrintedJson)
                self.apiResponseHeading1.isHidden = false
                self.apiResponseValu1.isHidden = false
                self.apiResponseValu1.text = prettyPrintedJson
                
                // Once we get data then call Leave
                dispatchGroup.leave()
                print("Task 1 Completed: Dispatch group In Left")
                
            } catch {
                print("Error: Trying to convert JSON data to string")
                return
            }
        }
        
        // TASK SECOND
        // Enter for Second  API
        dispatchGroup.enter()
        print("Task 2 Started: Dispatch group In Entered")
        
        AF.request("https://reqres.in/api/users/2", parameters: nil, headers: nil).validate(statusCode: 200 ..< 299).responseJSON { AFdata in
            do {
                guard let jsonObject = try JSONSerialization.jsonObject(with: AFdata.data!) as? [String: Any] else {
                    print("Error: Cannot convert data to JSON object")
                    return
                }
                guard let prettyJsonData = try? JSONSerialization.data(withJSONObject: jsonObject, options: .prettyPrinted) else {
                    print("Error: Cannot convert JSON object to Pretty JSON data")
                    return
                }
                guard let prettyPrintedJson = String(data: prettyJsonData, encoding: .utf8) else {
                    print("Error: Could print JSON in String")
                    return
                }
                
               // print(prettyPrintedJson)
                self.apiResponseHeading2.isHidden = false
                self.apiResponseValu2.isHidden = false
                self.apiResponseValu2.text = prettyPrintedJson
                
                // Once we get data then call Leave
                dispatchGroup.leave()
                print("Task 2 Completed: Dispatch group In Left")
                
            } catch {
                print("Error: Trying to convert JSON data to string")
                return
            }
        }
        
        
        // TASK 3
        // Enter for Third  API
        dispatchGroup.enter()
        print("Task 3 Started: Dispatch group In Entered")
        
        AF.request("https://reqres.in/api/users/23", parameters: nil, headers: nil).validate(statusCode: 200 ..< 299).responseJSON { AFdata in
            do {
                guard let jsonObject = try JSONSerialization.jsonObject(with: AFdata.data!) as? [String: Any] else {
                    print("Error: Cannot convert data to JSON object")
                    return
                }
                guard let prettyJsonData = try? JSONSerialization.data(withJSONObject: jsonObject, options: .prettyPrinted) else {
                    print("Error: Cannot convert JSON object to Pretty JSON data")
                    return
                }
                guard let prettyPrintedJson = String(data: prettyJsonData, encoding: .utf8) else {
                    print("Error: Could print JSON in String")
                    return
                }
                
               // print(prettyPrintedJson)
                self.apiResponseHeading3.isHidden = false
                self.apiResponseValu3.isHidden = false
                self.apiResponseValu3.text = prettyPrintedJson
                
                // Once we get data then call Leave
                dispatchGroup.leave()
                print("Task 3 Completed: Dispatch group In Left")
                
            } catch {
                print("Error: Trying to convert JSON data to string")
                return
            }
        }
        
    
        // `Notify Main thread`
        dispatchGroup.notify(queue: .main) {
            //self.isLoading = true // used for showing loader ..etc
            print("End Test") // it will execute at last once all API calls get completes
        }
        
    }
    
}

