//
//  ViewController.swift
//  JSON Demo
//
//  Created by Carl Goldberg on 2/22/15.
//  Copyright (c) 2015 Tangent Circles. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        // Download contents of url and println
        
        let url = NSURL(string: "http://www.telize.com/geoip")
        
        let session = NSURLSession.sharedSession()
        let task = session.dataTaskWithURL(url!, completionHandler: {data, response, error -> Void in
            if (error != nil) {
                println(error)
            } else {
               let jsonResult = NSJSONSerialization.JSONObjectWithData(data, options: NSJSONReadingOptions.MutableContainers, error: nil) as NSDictionary
                // JSON is like a dictionary
                
                println(jsonResult)
                println(jsonResult["city"]!)
                
            }
        
        })
        task.resume()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

