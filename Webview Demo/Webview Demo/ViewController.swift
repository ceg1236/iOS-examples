//
//  ViewController.swift
//  Webview Demo
//
//  Created by Carl Goldberg on 2/22/15.
//  Copyright (c) 2015 Tangent Circles. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var webView: UIWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        /*  Load page from web
        
        var url = NSURL(string: "http://www.google.com")
        
        var request = NSURLRequest(URL: url!)
        
        webView.loadRequest(request)

        */
        
        
        // Just display html
        var html = "<html><head></head><body><h1>Hello World</h1></body></html>"
        
        webView.loadHTMLString(html, baseURL: nil)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

