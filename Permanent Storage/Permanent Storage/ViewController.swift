//
//  ViewController.swift
//  Permanent Storage
//
//  Created by Carl Goldberg on 2/13/15.
//  Copyright (c) 2015 Tangent Circles. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        NSUserDefaults.standardUserDefaults().setObject("Carl", forKey: "name")
        var name = NSUserDefaults.standardUserDefaults().objectForKey("name")! as String
        println(name)
        
        var arr = [1,2,3]
        
//        NSUserDefaults.standardUserDefaults().setObject(arr, forKey: "array")
        var recall = NSUserDefaults.standardUserDefaults().objectForKey("array")! as NSArray
        
        println(recall[2])
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

