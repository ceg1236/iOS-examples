//
//  ViewController.swift
//  Controlling the Keyboard
//
//  Created by Carl Goldberg on 2/13/15.
//  Copyright (c) 2015 Tangent Circles. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {



    @IBOutlet var box: UITextField!

    @IBOutlet var result: UILabel!
    
    @IBAction func update(sender: AnyObject) {
        
        result.text = box.text
        self.view.endEditing(true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.box.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func touchesBegan(touches: NSSet, withEvent event: UIEvent) {
        self.view.endEditing(true)
    }
    
    func textFieldShouldReturn(textField: UITextField!) -> Bool {
        
        textField.resignFirstResponder()
        
        return true
    }
}

