//
//  UserTableTableViewController.swift
//  InstaClone
//
//  Created by Carl Goldberg on 2/24/15.
//  Copyright (c) 2015 Tangent Circles. All rights reserved.
//

import UIKit

class UserTableTableViewController: UITableViewController {
    
    var users = [String]()
    var followingTable = Dictionary<NSString, Bool>()
    
    var refresher: UIRefreshControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateUsers()
        
        refresher = UIRefreshControl()
        refresher.attributedTitle = NSAttributedString(string: "Pull to refresh")
        refresher.addTarget(self, action: "refresh", forControlEvents: UIControlEvents.ValueChanged)
        self.tableView.addSubview(refresher)
        
    }
    
    func updateUsers() {
        var query = PFUser.query()
        
        query.findObjectsInBackgroundWithBlock({ (objects: [AnyObject]!, error: NSError!) -> Void in
            
            self.users.removeAll(keepCapacity: true)
            
            for user:PFUser in objects as [PFUser] {
                
                var isFollowing:Bool
                
                if user.username != PFUser.currentUser().username {
                    
                    self.users.append(user.username)
                    
                    var query = PFQuery(className:"Followers")
                    query.whereKey("follower", equalTo: PFUser.currentUser().username)
                    query.whereKey("following", equalTo: user.username)
                    
                    query.findObjectsInBackgroundWithBlock {
                        (objects: [AnyObject]!, error: NSError!) -> Void in
                        if error == nil {
                            // The find succeeded.
                            
                            for object:PFObject in objects as[PFObject] {
                                // get a variable named username, from the object
                                // assign the key of followingTable[username] = true
                                var username = object.valueForKey("following") as NSString
                                self.followingTable[username] = true
                            }
                            
                            // Bad practice, but works for a few users
                            self.tableView.reloadData()
                        } else {
                            println(error)
                        }
                        
                        self.refresher.endRefreshing()
                    }
                }
            }
        })

    }
    
    func refresh() {
        println("Feeling refreshed")
        updateUsers()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Potentially incomplete method implementation.
        // Return the number of sections.
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete method implementation.
        // Return the number of rows in the section.
        return users.count
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell:UITableViewCell = self.tableView.dequeueReusableCellWithIdentifier("cell") as UITableViewCell
        
     
        var username = users[indexPath.row]
    
        if (followingTable[username] != nil) {
            cell.accessoryType = .Checkmark
        }

        
        cell.textLabel?.text = users[indexPath.row]
        
        return cell
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
 
        var cell:UITableViewCell = tableView.cellForRowAtIndexPath(indexPath)!
        
        if cell.accessoryType == .Checkmark {
            cell.accessoryType = .None
            
            var query = PFQuery(className:"Followers")
            query.whereKey("follower", equalTo: PFUser.currentUser().username)
            query.whereKey("following", equalTo: cell.textLabel?.text)
            
            query.findObjectsInBackgroundWithBlock {
                (objects: [AnyObject]!, error: NSError!) -> Void in
                if error == nil {
                    // The find succeeded.
                    
                    for object in objects {
                        println(object)
                        object.deleteInBackgroundWithBlock(nil)

                    }
                } else {
                    println(error)
                }
            }
        } else {
            cell.accessoryType = UITableViewCellAccessoryType.Checkmark
            
//            var query = PFQuery(className: "Followers")
            var following = PFObject(className: "Followers")
            following["following"] = cell.textLabel?.text
            following["follower"] = PFUser.currentUser().username
            
            following.saveInBackgroundWithBlock(nil)
        }
        
    }
}
