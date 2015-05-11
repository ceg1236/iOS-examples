//
//  ViewController.swift
//  music
//
//  Created by Carl Goldberg on 2/21/15.
//  Copyright (c) 2015 Tangent Circles. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {

    var player:AVAudioPlayer = AVAudioPlayer()
    
    @IBAction func volume(sender: AnyObject) {
        player.stop()
    }
    @IBAction func stop(sender: AnyObject) {
        player.volume = 0 
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        var fileLocation = NSString(string:NSBundle.mainBundle().pathForResource("song", ofType: "mp3")!)
        var error:NSError? = nil
        
        player = AVAudioPlayer(contentsOfURL: NSURL(string:fileLocation), error: &error)
        
        player.play()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

