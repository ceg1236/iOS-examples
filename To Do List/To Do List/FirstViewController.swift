//
//  FirstViewController.swift
//  To Do List
//
//  Created by Carl Goldberg on 2/14/15.
//  Copyright (c) 2015 Tangent Circles. All rights reserved.
//

import UIKit

var list = [String]()

class FirstViewController: UIViewController, UITableViewDelegate {
    
    
    @IBOutlet var todoList: UITableView!
    
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return list.count
    }
    
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = UITableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: "Cell")
        
        cell.textLabel?.text = list[indexPath.row]
        
        return cell
    }
    
    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath){
        
        if editingStyle == UITableViewCellEditingStyle.Delete {
            list.removeAtIndex(indexPath.row)
            NSUserDefaults.standardUserDefaults().setObject("todoList", forKey: "todoList")
            
            todoList.reloadData()
        }
        
    }
    
    override func viewDidAppear(animated: Bool) {
        todoList.reloadData()
    }


    override func viewDidLoad() {
        super.viewDidLoad()
        
        if NSUserDefaults.standardUserDefaults().objectForKey("todoList") != nil {
            list = NSUserDefaults.standardUserDefaults().objectForKey("todoList") as [String]
        }
       
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

