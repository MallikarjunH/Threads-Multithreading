//
//  Downloader.swift
//  OperationQueueEx2
//
//  Created by EOO61 on 15/09/21.
//

import Foundation
import UIKit

class Downloader {
    
    class func downloadImageWithURL(_ url:String) -> UIImage! {
        
        let data = NSData(contentsOf: NSURL(string: url)! as URL)
        return UIImage(data: data! as Data)
    }
}
