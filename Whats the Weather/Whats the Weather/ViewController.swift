//
//  ViewController.swift
//  Whats the Weather
//
//  Created by Carl Goldberg on 2/15/15.
//  Copyright (c) 2015 Tangent Circles. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var userCity: UITextField!
    
    @IBOutlet var resultLabel: UILabel!
    
    func showError() {
        resultLabel.text = "Was not able to find weather in "+userCity.text
    }
    
    @IBAction func findWeather(sender: AnyObject) {
        
        
        var url = NSURL(string: "http://www.weather-forecast.com/locations/" + userCity.text + "/forecasts/latest")
        
        if url != nil {
            let task = NSURLSession.sharedSession().dataTaskWithURL(url!, completionHandler: { (data, response, error) -> Void in
                
                var urlError = false
                var weather = ""
                
                if error == nil {
                    var urlContent = NSString(data: data, encoding: NSUTF8StringEncoding) as NSString!
                    
                    var urlContentArray = urlContent.componentsSeparatedByString("<span class=\"phrase\">")
                    
                    var weatherArray = urlContentArray[1].componentsSeparatedByString("</span")
                    
                    weather = weatherArray[0] as String
                    
                    
                } else {
                    urlError = true
                    
                }
                
                dispatch_async(dispatch_get_main_queue()) {
                    if urlError == true {
                        self.showError()
                    } else {
                        self.resultLabel.text = weather
                    }
                    
                }
            })
            
            task.resume()
            
        } else {
            showError()
        }
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

