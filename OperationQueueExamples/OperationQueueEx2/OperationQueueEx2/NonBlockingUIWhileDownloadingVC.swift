//
//  NonBlockingUIWhileDownloadingVC.swift
//  OperationQueueEx2
//
//  Created by EOO61 on 16/09/21.
//

import UIKit

class NonBlockingUIWhileDownloadingVC: UIViewController {

    let imageURLs = ["http://www.planetware.com/photos-large/F/france-paris-eiffel-tower.jpg",
                     "http://adriatic-lines.com/wp-content/uploads/2015/04/canal-of-Venice.jpg",
                     "https://s1.ax1x.com/2017/12/06/oaiz8.png",
                     "https://s1.ax1x.com/2017/12/06/oakQS.jpg"]
    
    @IBOutlet weak var imageView1: UIImageView!
    @IBOutlet weak var imageView2: UIImageView!
    @IBOutlet weak var imageView3: UIImageView!
    @IBOutlet weak var imageView4: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func didClickOnStart(sender: AnyObject) {
        
        //https://developer.apple.com/library/archive/documentation/Performance/Conceptual/EnergyGuide-iOS/PrioritizeWorkWithQoS.html
        //Returns the global system queue with the specified quality of service class
        let queue = DispatchQueue.global(qos: .default)
        
        queue.async {
            let img1 = Downloader.downloadImageWithURL(self.imageURLs[0])
            DispatchQueue.main.async {
                self.imageView1.image = img1
            }
        }
        
        queue.async {
            let img2 = Downloader.downloadImageWithURL(self.imageURLs[1])
            DispatchQueue.main.async {
                self.imageView2.image = img2
            }
        }
        
        queue.async {
            let img3 = Downloader.downloadImageWithURL(self.imageURLs[2])
            DispatchQueue.main.async {
                self.imageView3.image = img3
            }
        }
        
        queue.async {
            let img4 = Downloader.downloadImageWithURL(self.imageURLs[3])
            DispatchQueue.main.async {
                self.imageView4.image = img4
            }
        }
    }
}
