//
//  ViewController.swift
//  Storing images
//
//  Created by Carl Goldberg on 2/22/15.
//  Copyright (c) 2015 Tangent Circles. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var pic: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        var url = NSURL(string: "http://upload.wikimedia.org/wikipedia/commons/thumb/f/f8/Python_logo_and_wordmark.svg/486px-Python_logo_and_wordmark.svg.png")
        
        let urlRequest = NSURLRequest(URL: url!)
        
        NSURLConnection.sendAsynchronousRequest(urlRequest, queue: NSOperationQueue.mainQueue(), completionHandler: {
            response, data, error in
            
            if error != nil {
                println("ERROR")
            } else {
                let image = UIImage(data: data)
//              Simplest way
//                self.pic.image = image

//              To save and persist image data
//              Commented out to prove the data has been stored and not make the request again
//                var documentsDirectory:String?
//                
//                var paths:[AnyObject] = NSSearchPathForDirectoriesInDomains(NSSearchPathDirectory.DocumentDirectory, NSSearchPathDomainMask.UserDomainMask, true)
//                
//                if paths.count > 0 {
//                    documentsDirectory = paths[0] as? String
//                    
//                    var savePath = documentsDirectory! + "/python.png"
//                    
//                    NSFileManager.defaultManager().createFileAtPath(savePath, contents: data, attributes: nil)
//                    
//                    self.pic.image = UIImage(named: savePath)
//                }
            }
        })
        
//        Access files from saved location
        var documentsDirectory:String?
        
        var paths:[AnyObject] = NSSearchPathForDirectoriesInDomains(NSSearchPathDirectory.DocumentDirectory, NSSearchPathDomainMask.UserDomainMask, true)
        
        if paths.count > 0 {
            documentsDirectory = paths[0] as? String
            
            
            var savePath = documentsDirectory! + "/python.png"
            
            self.pic.image = UIImage(named: savePath)
        }
        
    }

     override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

