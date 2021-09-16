//
//  BlockingUIWhileDownloadingVC.swift
//  OperationQueueEx2
//
//  Created by EOO61 on 16/09/21.
//

import UIKit

class BlockingUIWhileDownloadingVC: UIViewController {

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
        let img1 = Downloader.downloadImageWithURL(imageURLs[0])
        imageView1.image = img1
        
        let img2 = Downloader.downloadImageWithURL(imageURLs[1])
        imageView2.image = img2
        
        let img3 = Downloader.downloadImageWithURL(imageURLs[2])
        imageView3.image = img3
        
        let img4 = Downloader.downloadImageWithURL(imageURLs[3])
        imageView4.image = img4
    }
    
}
