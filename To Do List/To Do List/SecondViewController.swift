//
//  SecondViewController.swift
//  To Do List
//
//  Created by Carl Goldberg on 2/14/15.
//  Copyright (c) 2015 Tangent Circles. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

    
    
    @IBOutlet var todoItem: UITextField!
    
    @IBAction func submit(sender: AnyObject) {
        
        list.append(todoItem.text)
        
        todoItem.text = ""
        
        NSUserDefaults.standardUserDefaults().setObject(list, forKey: "todoList")
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func touchesBegan(touches: NSSet, withEvent event: UIEvent) {
        self.view.endEditing(true)
    }
    
    func textFieldShoudlReturn(textField: UITextField!) -> Bool {
        todoItem.resignFirstResponder()
        return true
    }
}

