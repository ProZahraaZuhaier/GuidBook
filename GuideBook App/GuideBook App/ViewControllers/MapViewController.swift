//
//  MapViewController.swift
//  GuideBook App
//
//  Created by Zahraa Zuhaier L on 03/09/2021.
//

import UIKit
import MapKit

class MapViewController: UIViewController {

    
    // MARK:- Variables and Properties
    var place:Place?
    
    @IBOutlet weak var mapView: MKMapView!
    // MARK:- ViewControllers LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    // MARK:- Methods
    override func viewWillAppear(_ animated: Bool) {
        if place != nil {
            
            // Create a CCLocationCoordinate2D
            let location = CLLocationCoordinate2D(latitude: place!.lat, longitude: place!.long)
            
            // Create a pin
            let pin = MKPointAnnotation()
            pin.coordinate = location
            
            // Add that pin  to the map
            mapView.addAnnotation(pin)
            
            // Create a region to zoom
            let region = MKCoordinateRegion(center: location, latitudinalMeters: 100, longitudinalMeters: 100)
            mapView.setRegion(region, animated: false)
        }
    }

}
