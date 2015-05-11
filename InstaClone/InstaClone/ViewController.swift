//
//  ViewController.swift
//  InstaClone
//
//  Created by Carl Goldberg on 2/23/15.
//  Copyright (c) 2015 Tangent Circles. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UINavigationControllerDelegate, UIImagePickerControllerDelegate {

    var activityIndicator:UIActivityIndicatorView = UIActivityIndicatorView()
    
    @IBOutlet var chosenImage: UIImageView!

    
    func imagePickerController(picker: UIImagePickerController!, didFinishPickingImage image: UIImage!, editingInfo: [NSObject : AnyObject]!) {
        println("image selected")
        self.dismissViewControllerAnimated(true, completion: nil)
        
        chosenImage.image = image
    }
    
    @IBAction func chooseImage(sender: AnyObject) {
        
        var image = UIImagePickerController()
        image.delegate = self

        //  To access current photos
        image.sourceType = UIImagePickerControllerSourceType.PhotoLibrary

        //  To access the camera... doesn't work in simulator
        //  image.sourceType = UIImagePickerControllerSourceType.Camera
        image.allowsEditing = false
        
        self.presentViewController(image, animated: true, completion: nil)
        
    }
    
    @IBAction func pause(sender: AnyObject) {
        activityIndicator = UIActivityIndicatorView(frame: CGRectMake(0, 0, 50, 50))
        activityIndicator.center = self.view.center
        activityIndicator.hidesWhenStopped = true
        activityIndicator.activityIndicatorViewStyle = .Gray
        view.addSubview(activityIndicator)
        activityIndicator.startAnimating()
//        UIApplication.sharedApplication().beginIgnoringInteractionEvents()
    }
    
    @IBAction func restore(sender: AnyObject) {
        activityIndicator.stopAnimating()
//        UIApplication.sharedApplication().endIgnoringInteractionEvents()
    }
    
    
    @IBAction func alert(sender: AnyObject, controller: UIViewController) {
        
        var alert = UIAlertController(title: "Hello!", message: "Rly?", preferredStyle: UIAlertControllerStyle.Alert)
        
        alert.addAction(UIAlertAction(title: "OK", style: .Default, handler: { action in
        
            self.dismissViewControllerAnimated(true, completion: nil)
        }))
        
        self.presentViewController(alert, animated: true, completion: nil)
        // Utils.alert("Oopsies", self)
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        println(PFUser.currentUser())

// PARSE
        Parse.setApplicationId("AVx9LrQRvAkrOWAnEz0x7SwMppnqs9DOOc398lLy", clientKey: "vsEHC9RWfNNgqYkwqx3mXhyb35Uma7dLp33gAoaY")

        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}


// Additional Parse functionalities 
/*
var score = PFObject(className: "score")
score.setObject("CEG", forKey: "name")
score.setObject(314159, forKey: "value")

score.saveInBackgroundWithBlock {
//            Asynchronous callback
    (success: Bool!, error: NSError!) -> Void in
    if success == true {
        println("Score created with ID: \(score.objectId)")
    } else {
        println(error)
    }
}


var query = PFQuery(className: "score")
query.getObjectInBackgroundWithId("0TLAhcOpsX") {
    (score: PFObject!, error: NSError!) -> Void in
    if error == nil {

//      println(score.objectForKey("name") as NSString)

        score["name"] = "Carlos"
        score["score"] = 108

        score.saveInBackgroundWithBlock(nil)


    } else {
        println(error)
    }
}

*/



