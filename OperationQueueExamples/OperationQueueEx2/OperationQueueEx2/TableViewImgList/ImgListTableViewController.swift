//
//  ImgListTableViewController.swift
//  OperationQueueEx2
//
//  Created by EOO61 on 16/09/21.
//

import UIKit

class ImgListTableViewController: UIViewController {

    let imageURLs = ["http://www.planetware.com/photos-large/F/france-paris-eiffel-tower.jpg",
                     "http://adriatic-lines.com/wp-content/uploads/2015/04/canal-of-Venice.jpg",
                     "https://s1.ax1x.com/2017/12/06/oaiz8.png",
                     "https://s1.ax1x.com/2017/12/06/oakQS.jpg","http://adriatic-lines.com/wp-content/uploads/2015/04/canal-of-Venice.jpg",
        "https://s1.ax1x.com/2017/12/06/oaiz8.png","http://adriatic-lines.com/wp-content/uploads/2015/04/canal-of-Venice.jpg",
        "https://s1.ax1x.com/2017/12/06/oaiz8.png",
        "https://s1.ax1x.com/2017/12/06/oakQS.jpg","https://s1.ax1x.com/2017/12/06/oaiz8.png","http://www.planetware.com/photos-large/F/france-paris-eiffel-tower.jpg",
        "http://adriatic-lines.com/wp-content/uploads/2015/04/canal-of-Venice.jpg",
        "https://s1.ax1x.com/2017/12/06/oaiz8.png",
        "https://s1.ax1x.com/2017/12/06/oakQS.jpg","http://adriatic-lines.com/wp-content/uploads/2015/04/canal-of-Venice.jpg",
"https://s1.ax1x.com/2017/12/06/oaiz8.png","http://adriatic-lines.com/wp-content/uploads/2015/04/canal-of-Venice.jpg",
"https://s1.ax1x.com/2017/12/06/oaiz8.png",
"https://s1.ax1x.com/2017/12/06/oakQS.jpg","https://s1.ax1x.com/2017/12/06/oaiz8.png","http://www.planetware.com/photos-large/F/france-paris-eiffel-tower.jpg",
"http://adriatic-lines.com/wp-content/uploads/2015/04/canal-of-Venice.jpg",
"https://s1.ax1x.com/2017/12/06/oaiz8.png",
"https://s1.ax1x.com/2017/12/06/oakQS.jpg","http://adriatic-lines.com/wp-content/uploads/2015/04/canal-of-Venice.jpg",
"https://s1.ax1x.com/2017/12/06/oaiz8.png","http://adriatic-lines.com/wp-content/uploads/2015/04/canal-of-Venice.jpg",
"https://s1.ax1x.com/2017/12/06/oaiz8.png",
"https://s1.ax1x.com/2017/12/06/oakQS.jpg","https://s1.ax1x.com/2017/12/06/oaiz8.png","http://www.planetware.com/photos-large/F/france-paris-eiffel-tower.jpg",
"http://adriatic-lines.com/wp-content/uploads/2015/04/canal-of-Venice.jpg",
"https://s1.ax1x.com/2017/12/06/oaiz8.png",
"https://s1.ax1x.com/2017/12/06/oakQS.jpg","http://adriatic-lines.com/wp-content/uploads/2015/04/canal-of-Venice.jpg",
"https://s1.ax1x.com/2017/12/06/oaiz8.png","http://adriatic-lines.com/wp-content/uploads/2015/04/canal-of-Venice.jpg",
"https://s1.ax1x.com/2017/12/06/oaiz8.png",
"https://s1.ax1x.com/2017/12/06/oakQS.jpg","https://s1.ax1x.com/2017/12/06/oaiz8.png"]
    
    @IBOutlet weak var mainTableView: UITableView!
    
    let queue = DispatchQueue.global(qos: .default)
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        mainTableView.reloadData()
    }


}

extension ImgListTableViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return imageURLs.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "ImageTableViewCell") as! ImageTableViewCell
        cell.indexlabel.text = "\(indexPath.row)"
        
        queue.async {
            let img = Downloader.downloadImageWithURL(self.imageURLs[indexPath.row])
    
            DispatchQueue.main.async {
                cell.imageOutlet.image = img
            }

        }

        return cell
    
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 122.0
    }
}
