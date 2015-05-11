//
//  Utils.swift
//  InstaClone
//
//  Created by Carl Goldberg on 2/24/15.
//  Copyright (c) 2015 Tangent Circles. All rights reserved.
//

import UIKit

class Utils {
    class func alert(text:NSString, controller: UIViewController) {
        
        var alert = UIAlertController(title: "Oh No!", message: text, preferredStyle: .Alert)
        
        alert.addAction(UIAlertAction(title: "OK", style: .Default, handler: { action in
            alert.dismissViewControllerAnimated(true, completion: nil)
        }))
    
        controller.presentViewController(alert, animated: true, completion: nil)
        
    }
}
