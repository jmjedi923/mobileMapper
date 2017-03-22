//
//  ViewController.swift
//  mobileMapperLecture
//
//  Created by student3 on 3/20/17.
//  Copyright © 2017 John Hersey High School. All rights reserved.
//

import UIKit
import MapKit
import MediaPlayer

class ViewController: UIViewController, MKMapViewDelegate {

    @IBOutlet weak var mapKit: MKMapView!
      let herseyAnnotation = MKPointAnnotation()
    var address = "McDonalds"
    let geocoder = CLGeocoder()
    let locationManager = CLLocationManager()
    override func viewDidLoad() {
        super.viewDidLoad()
        
      
        let latitude: Double = 42.102332924
        let longitude: Double = -87.955667844
        let coordinate = CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
        herseyAnnotation.coordinate = coordinate
        herseyAnnotation.title = "John Hersey Highschool"
        mapKit.addAnnotation(herseyAnnotation)
        mapKit.delegate = self
        
       geocoder.geocodeAddressString(address) { (placemarks, error) in
        for place in placemarks!
        {
            let annontation = MKPointAnnotation()
            annontation.coordinate = (place.location?.coordinate)!
            annontation.title = place.name
            self.mapKit.addAnnotation(annontation)
        }
        }
     locationManager.requestWhenInUseAuthorization()
        self.mapKit.showsUserLocation = true
    }
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        var pin = MKAnnotationView(annotation: annotation, reuseIdentifier: nil)
        pin.image = UIImage(named: "tinyAoba")
        pin.canShowCallout = true
        let button = UIButton(type: .detailDisclosure)
        pin.rightCalloutAccessoryView = button
        return pin
    }
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

