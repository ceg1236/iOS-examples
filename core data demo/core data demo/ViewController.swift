//
//  ViewController.swift
//  core data demo
//
//  Created by Carl Goldberg on 2/21/15.
//  Copyright (c) 2015 Tangent Circles. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        // Set up context to work with database
        
        var appDel:AppDelegate = UIApplication.sharedApplication().delegate as AppDelegate
        
        var context:NSManagedObjectContext = appDel.managedObjectContext!
        
        var newUser = NSEntityDescription.insertNewObjectForEntityForName("Users", inManagedObjectContext:context) as NSManagedObject
        
//        newUser.setValue("Jose", forKey: "username")
//        newUser.setValue("ghi", forKey: "password")
        
//        context.save(nil)
        
        var request = NSFetchRequest(entityName: "Users")

//      Possibly required depending on Xcode version
//        request.returnsObjectsAsFaults = false
        
        request.predicate = NSPredicate(format: "username = %@", "Rob")
        
        var results = context.executeFetchRequest(request, error: nil)
        
        
        for result:AnyObject in results! {
            
//            println(results)
            
            if let user = result.valueForKey("username") as? String {
                
                if user == "Rob" {
                    
                    
//                    context.deleteObject(result as NSManagedObject)
//                    println(user + " has been deleted")
                    
                    result.setValue("xyz", forKey: "password")
                    println(result)
                }
                
            }
            context.save(nil)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

