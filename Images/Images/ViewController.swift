//
//  ViewController.swift
//  Images
//
//  Created by Carl Goldberg on 2/16/15.
//  Copyright (c) 2015 Tangent Circles. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var timer = NSTimer()
    
    @IBOutlet var gita: UIImageView!
    
    var photoReel = ["gita-005b.jpg", "Goldberg_6.jpg", "Goldberg_10.jpg"]
    
    
    var count = 1
    @IBAction func change(sender: AnyObject) {
    
        if count == photoReel.count {
            count = 0
        }
        let frame2 = UIImage(named:photoReel[count])
            
        gita.image = frame2
    
        count++
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        timer = NSTimer.scheduledTimerWithTimeInterval(1, target: self, selector: "result", userInfo: nil, repeats: true)
        
    }
    
    func result() {
        if count == photoReel.count {
            count = 0
        }
        let frame2 = UIImage(named:photoReel[count])
        
        gita.image = frame2
        
        count++
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewDidLayoutSubviews() {
        
//      gita.center = CGPointMake(gita.center.x - 400, gita.center.y)
//        gita.alpha = 0
//        gita.frame = CGRectMake(100, 20, 0, 0)
        
    }

    override func viewDidAppear(animated: Bool) {
        UIView.animateWithDuration(1, animations: {
          self.gita.center = CGPointMake(self.gita.center.x + 400, self.gita.center.y)
          self.gita.alpha = 1
          self.gita.frame = CGRectMake(100, 20, 0, 0)

        })
    }

}

