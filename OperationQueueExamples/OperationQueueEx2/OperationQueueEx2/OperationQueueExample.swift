//
//  OperationQueueExample.swift
//  OperationQueueEx2
//
//  Created by EOO61 on 15/09/21.
//

import UIKit

class OperationQueueExample: UIViewController {

    let imageURLs = ["http://www.planetware.com/photos-large/F/france-paris-eiffel-tower.jpg",
                     "http://adriatic-lines.com/wp-content/uploads/2015/04/canal-of-Venice.jpg",
                     "https://s1.ax1x.com/2017/12/06/oaiz8.png",
                     "https://s1.ax1x.com/2017/12/06/oakQS.jpg"]
    
    @IBOutlet weak var imageView1: UIImageView!
    @IBOutlet weak var imageView2: UIImageView!
    @IBOutlet weak var imageView3: UIImageView!
    @IBOutlet weak var imageView4: UIImageView!
    
    let queue = OperationQueue()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func didClickOnStart(sender: AnyObject) {
        
        //Note - If you enable next line, it will execte 1 blocks at a time in a sequence e.g Task1, Task2, Task3, Task4
        //if not enabled then it will run asynchronosly - in this case it wont execte in a seqeunce order. e.g Task1, Taks3, Task 2, Task4 or any order dynamically
        
        //queue.maxConcurrentOperationCount = 1 //Read note information
        
        queue.addOperation {
            let img1 = Downloader.downloadImageWithURL(self.imageURLs[0])
            //            DispatchQueue.main.async {
            //                self.imageView1.image = img1
            //            }
            print("1")
            OperationQueue.main.addOperation {
                print("1 - sub")
                self.imageView1.image = img1
            }
        }
        
        queue.addOperation {
            let img2 = Downloader.downloadImageWithURL(self.imageURLs[1])
            print("2")
            OperationQueue.main.addOperation {
                print("2 - sub")
                self.imageView2.image = img2
            }
        }
        
        queue.addOperation {
            let img3 = Downloader.downloadImageWithURL(self.imageURLs[2])
            print("3")
            OperationQueue.main.addOperation {
                print("3 - sub")
                self.imageView3.image = img3
            }
        }
        
        queue.addOperation {
            let img4 = Downloader.downloadImageWithURL(self.imageURLs[3])
            print("4")
            OperationQueue.main.addOperation {
                print("4 - sub")
                self.imageView4.image = img4
            }
        }
        
        //OR Using loop
        
        /*
        queue.addOperation {
            
            for (index,imageURL) in self.imageURLs.enumerated() {
                
                let img = Downloader.downloadImageWithURL(imageURL)
                OperationQueue.main.addOperation {
                    print("Index is: \(index)")
                    self.imageView1.image = img
                }
            }
        }
        */
        
    }

}
