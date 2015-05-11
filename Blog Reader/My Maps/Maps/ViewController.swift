//
//  ViewController.swift
//  Learning Maps
//
//  Created by Rob Percival on 11/07/2014.
//  Copyright (c) 2014 Appfish. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation


class ViewController: UIViewController, CLLocationManagerDelegate {
    
    
    @IBOutlet var myMap: MKMapView!
    
    @IBAction func findMe(sender: AnyObject) {
        
        manager.requestWhenInUseAuthorization()
        manager.startUpdatingLocation()
    
    }
    @IBOutlet var latitude : UILabel!
    @IBOutlet var longitude : UILabel!
    @IBOutlet var address : UILabel!
    @IBOutlet var altitude : UILabel!
    @IBOutlet var speed : UILabel!
    @IBOutlet var heading : UILabel!
    
    var manager:CLLocationManager!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        manager = CLLocationManager()
        manager.delegate = self
        manager.desiredAccuracy = kCLLocationAccuracyBest
        
        if activePlace == -1 {
            manager.requestWhenInUseAuthorization()
            manager.startUpdatingLocation()
        } else {

            let lat = NSString(string: places[activePlace]["lat"]!).doubleValue
            let lon = NSString(string: places[activePlace]["lon"]!).doubleValue

            self.setMapRegion(lat, lon: lon, zoom:0.01)
            
            var annotation = MKPointAnnotation()
            annotation.coordinate = CLLocationCoordinate2DMake(lat, lon)
            annotation.title = places[activePlace]["name"]
            
            myMap.addAnnotation(annotation)
            
            var uilpgr = UILongPressGestureRecognizer(target: self, action: "action:")
            uilpgr.minimumPressDuration = 2.0
            myMap.addGestureRecognizer(uilpgr)
            
        }
        
    }
    
    func action(gestureRecognizer:UIGestureRecognizer) {
        
        var touchPoint = gestureRecognizer.locationInView(self.myMap)
        
        var newCoordinate = myMap.convertPoint(touchPoint, toCoordinateFromView: self.myMap)
        
        var annotation = MKPointAnnotation()
        annotation.coordinate = newCoordinate
        annotation.title = "New Place"
        
        myMap.addAnnotation(annotation)
    }
    
    func setMapRegion(lat:Double, lon:Double, zoom:Double) {
        
        var latitude:CLLocationDegrees = lat
        var longitude:CLLocationDegrees = lon
        
        var latDelta:CLLocationDegrees = zoom
        var lonDelta:CLLocationDegrees = zoom
        
        var span:MKCoordinateSpan = MKCoordinateSpanMake(latDelta, lonDelta)
        
        var location:CLLocationCoordinate2D = CLLocationCoordinate2DMake(latitude, longitude)
        
        var region:MKCoordinateRegion = MKCoordinateRegionMake(location, span)
        
        myMap.setRegion(region, animated: true)
    }
    
    func locationManager(manager:CLLocationManager, didUpdateLocations locations:[AnyObject]) {
        
        var userLocation:CLLocation = locations[0] as CLLocation
        
        var latitude:CLLocationDegrees = userLocation.coordinate.latitude
        
        var longitude:CLLocationDegrees = userLocation.coordinate.longitude
        
        self.setMapRegion(latitude, lon: longitude, zoom: 0.01)
        
        manager.stopUpdatingLocation()
        
        CLGeocoder().reverseGeocodeLocation(userLocation, completionHandler:{(placemarks, error) in
            
            if ((error) != nil)  { println("Error: \(error)") }
            else {
                
                let p = CLPlacemark(placemark: placemarks?[0] as CLPlacemark)
                
                var subThoroughfare:String
                
                if ((p.subThoroughfare) != nil) {
                    subThoroughfare = p.subThoroughfare
                } else {
                    subThoroughfare = ""
                }
                
                self.address.text =  "\(subThoroughfare) \(p.thoroughfare) \n \(p.subLocality) \n \(p.subAdministrativeArea) \n \(p.postalCode) \(p.country)"
                
                
            }
            
        })
        
    }
    
   
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

