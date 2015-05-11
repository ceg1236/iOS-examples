//
//  ViewController.swift
//  shakeNswipe
//
//  Created by Carl Goldberg on 2/21/15.
//  Copyright (c) 2015 Tangent Circles. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    var player:AVAudioPlayer = AVAudioPlayer()
    var error:NSError? = nil
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        var swipeRight = UISwipeGestureRecognizer(target: self, action: "swiped:")
        swipeRight.direction = UISwipeGestureRecognizerDirection.Right
        self.view.addGestureRecognizer(swipeRight)
        
        var swipeUp = UISwipeGestureRecognizer(target: self, action: "swiped:")
        swipeUp.direction = UISwipeGestureRecognizerDirection.Up
        self.view.addGestureRecognizer(swipeUp)
        
        var ele = NSString(string: NSBundle.mainBundle().pathForResource("ele", ofType: "mp3")!)
        
        player = AVAudioPlayer(contentsOfURL: NSURL(string:ele), error: &error)
        
        
        
    }
    
    override func motionEnded(motion: UIEventSubtype, withEvent event: UIEvent) {
        if event.subtype == UIEventSubtype.MotionShake {
            println("SHAKESHAKESHAKE")
            var ele = NSString(string: NSBundle.mainBundle().pathForResource("ele", ofType: "mp3")!)
            var error:NSError? = nil
            player = AVAudioPlayer(contentsOfURL: NSURL(string:ele), error: &error)
            player.play()
        }
    }

    func swiped(gesture:UIGestureRecognizer) {
        
        if let swipeGesture = gesture as? UISwipeGestureRecognizer {
            switch swipeGesture.direction {
            
            case UISwipeGestureRecognizerDirection.Right:
                var gee = NSString(string: NSBundle.mainBundle().pathForResource("gee", ofType: "mp3")!)
                player = AVAudioPlayer(contentsOfURL: NSURL(string:gee), error: &error)
                player.play()
                println("swiped right")
                break
            case UISwipeGestureRecognizerDirection.Up:
                var woo = NSString(string: NSBundle.mainBundle().pathForResource("woo", ofType: "mp3")!)
                player = AVAudioPlayer(contentsOfURL: NSURL(string:woo), error: &error)
                player.play()
                println("UPP")
            default:
                break
            }
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

