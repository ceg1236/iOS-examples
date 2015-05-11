//
//  ViewController.swift
//  Tables Views
//
//  Created by Carl Goldberg on 2/13/15.
//  Copyright (c) 2015 Tangent Circles. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate {
    
    var cellContent = ["Carl", "Jose", "Scott", "Matt", "Darryl"]
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return cellContent.count
    }
    

    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = UITableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: "Cell")
        
        cell.textLabel?.text = cellContent[indexPath.row]
        
        return cell
    }


    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

