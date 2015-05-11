//
//  LoginViewController.swift
//  InstaClone
//
//  Created by Carl Goldberg on 2/23/15.
//  Copyright (c) 2015 Tangent Circles. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet var username: UITextField!
    @IBOutlet var password: UITextField!
    
    @IBAction func login(sender: AnyObject) {
        PFUser.logInWithUsernameInBackground(username.text, password: password.text) {
            (user: PFUser!, error: NSError!) -> Void in
            if user != nil {
                // Do stuff after successful login.
                println("Login success!")
                println(user)
                
                self.performSegueWithIdentifier("loginToMain", sender: nil)
                
            } else {
                // The login failed. Check error to see why.
                Utils.alert("Incorrect username or password", controller: self)
                
                println("Big fat error, buddy")
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    Parse.setApplicationId("AVx9LrQRvAkrOWAnEz0x7SwMppnqs9DOOc398lLy", clientKey: "vsEHC9RWfNNgqYkwqx3mXhyb35Uma7dLp33gAoaY")
        
    }
    
    override func viewDidAppear(animated: Bool) {
        if PFUser.currentUser() != nil {
            self.performSegueWithIdentifier("loginToMain", sender: self)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
