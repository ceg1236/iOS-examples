//
//  SignupViewController.swift
//  InstaClone
//
//  Created by Carl Goldberg on 2/23/15.
//  Copyright (c) 2015 Tangent Circles. All rights reserved.
//

import UIKit

class SignupViewController: UIViewController {
    
    

    @IBOutlet var username: UITextField!
    @IBOutlet var password: UITextField!
    @IBAction func signUp(sender: AnyObject) {
        var user = PFUser()
        user.username = username.text
        user.password = password.text
//        user.email = "email3@example.com"
        // other fields can be set just like with PFObject
//        user["phone"] = "415-392-0202"
        
        user.signUpInBackgroundWithBlock {
            (succeeded: Bool!, error: NSError!) -> Void in
            if error == nil {
                // Hooray! Let them use the app now.
                println(user)
                self.performSegueWithIdentifier("signupToMain", sender: nil)
                
            } else {
                println("Error")
                Utils.alert("Username or password already exists", controller: self)    
                // Show the errorString somewhere and let the user try again.
            }
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
