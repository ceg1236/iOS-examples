//
//  ViewController.swift
//  Learning Maps
//
//  Created by Carl Goldberg on 2/16/15.
//  Copyright (c) 2015 Tangent Circles. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class ViewController: UIViewController, MKMapViewDelegate, CLLocationManagerDelegate {
    
    
    @IBOutlet var mapView: MKMapView!
    
    var manager = CLLocationManager()

    override func viewDidLoad() {
        super.viewDidLoad()
        
// Core Location
        manager.delegate = self
        manager.desiredAccuracy = kCLLocationAccuracyBest
        manager.requestWhenInUseAuthorization()
        manager.startUpdatingLocation()
        
        
// Set location
        var lat:CLLocationDegrees = 40.748655
        var lng:CLLocationDegrees = -73.985621
        
// Zoom level for default on viewDidLoad()
        var latDelta:CLLocationDegrees = 0.01
        var lngDelta:CLLocationDegrees = 0.01
        
        var span:MKCoordinateSpan = MKCoordinateSpanMake(latDelta, lngDelta)
        
        var location:CLLocationCoordinate2D = CLLocationCoordinate2DMake(lat, lng)
        
        var region:MKCoordinateRegion = MKCoordinateRegionMake(location, span)
        
        mapView.setRegion(region, animated: true)
        
        
// Annotations
        var annotation = MKPointAnnotation()
        
        annotation.coordinate = location
        
        annotation.title = "Statue of Liberty"
        
        annotation.subtitle = "One day..."
        
        mapView.addAnnotation(annotation)
        
        
// User annotations
        
        var uilpgr = UILongPressGestureRecognizer(target: self, action: "action:")
                                    //  action needs ':' if our func has params
        // Min press time in secs
        uilpgr.minimumPressDuration = 2.0
        
        mapView.addGestureRecognizer(uilpgr)
    
    }

    func action(gestureRecognizer:UIGestureRecognizer) {
        
        var touchPoint = gestureRecognizer.locationInView(self.mapView)
        
        var newCoordinate:CLLocationCoordinate2D = mapView.convertPoint(touchPoint, toCoordinateFromView: self.mapView)
        
        var userAnno = MKPointAnnotation()
        userAnno.coordinate = newCoordinate
        userAnno.title = "User touched me"
        userAnno.subtitle = "In this spot"
        mapView.addAnnotation(userAnno)
    }
    
// Fn to determine region based on given args
    func getRegion(latitude:CLLocationDegrees, longitude:CLLocationDegrees) {
        var latDelta:CLLocationDegrees = 0.01
        var lngDelta:CLLocationDegrees = 0.01
        
        var span:MKCoordinateSpan = MKCoordinateSpanMake(latDelta, lngDelta)
        
        var location:CLLocationCoordinate2D = CLLocationCoordinate2DMake(latitude, longitude)
        
        var region:MKCoordinateRegion = MKCoordinateRegionMake(location, span)
        
        mapView.setRegion(region, animated: true)
    }
    
    func locationManager(manager: CLLocationManager!, didUpdateLocations locations: [AnyObject]!) {
        
        var userLocation:CLLocation = locations[0] as CLLocation
        
        println(userLocation.coordinate.latitude)
        
        getRegion(userLocation.coordinate.latitude, longitude: userLocation.coordinate.longitude)
        
//        CLGeocoder().reverseGeocodeLocation(userLocation, completionHandler:{(placemarks, error) in
//            
//            if ((error) != nil)  { println("Error: \(error)") }
//            else {
//                
//                let p = CLPlacemark(placemark: placemarks?[0] as CLPlacemark)
//                
//                var subThoroughfare:String
//                
//                if ((p.subThoroughfare) != nil) {
//                    subThoroughfare = p.subThoroughfare
//                } else {
//                    subThoroughfare = ""
//                }
//                
//                self.address.text =  "\(subThoroughfare) \(p.thoroughfare) \n \(p.subLocality) \n \(p.subAdministrativeArea) \n \(p.postalCode) \(p.country)"
//                
//            }
//        }
    }
    
    func locationManager(manager: CLLocationManager!, didFailWithError error: NSError!) {
        println(error)
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

