//
//  ViewController.swift
//  Whatever you Like
//
//  Created by Carl Goldberg on 2/13/15.
//  Copyright (c) 2015 Tangent Circles. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var timer = NSTimer()
    
    var count = 0
    
    @IBOutlet var timerLabel: UILabel!
    
    func result() {
        
        count++
        timerLabel.text = "\(count)"
        
        println(count)
    }
    
    func start() {
        timer = NSTimer.scheduledTimerWithTimeInterval(1, target: self, selector: Selector("result"), userInfo: nil, repeats: true)
    }
    func stop () {
        timer.invalidate()
        count = 0
        
    }
    
    
    @IBAction func startTimer(sender: AnyObject) {
        start()
    }
    
    
    @IBAction func stopTimer(sender: AnyObject) {
        stop()
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
