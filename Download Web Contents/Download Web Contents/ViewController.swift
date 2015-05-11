//
//  ViewController.swift
//  Download Web Contents
//
//  Created by Carl Goldberg on 2/14/15.
//  Copyright (c) 2015 Tangent Circles. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var webView: UIWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let url = NSURL(string: "http://www.stackoverflow.com")
        let task = NSURLSession.sharedSession().dataTaskWithURL(url!) {
            (data, response, error) in
            
            if error == nil {
                
                var urlContent = NSString(data: data, encoding: NSUTF8StringEncoding)
                println(urlContent)
                
                dispatch_async(dispatch_get_main_queue()) {
                    
                    self.webView.loadHTMLString(urlContent!, baseURL: nil)
                }
            }
            
        }
        task.resume()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

