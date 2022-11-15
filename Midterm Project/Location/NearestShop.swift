//
//  NearestShop.swift
//  Midterm Project
//
//  Created by Justyce Graham on 11/3/22.
//

import UIKit
import MapKit

class NearestShop: UIViewController , CLLocationManagerDelegate, MKMapViewDelegate{
    
    private let locationManager = CLLocationManager()
    
    @IBOutlet weak var confirm: UIButton!
    @IBOutlet weak var MapView: MKMapView!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        
        MapView.showsUserLocation = true
        MapView.delegate = self
        
        
        
        MapView.mapType = .standard
        checkLocationServices()
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        locationManager.startUpdatingLocation()
    }
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        locationManager.stopUpdatingLocation()
    }
    
    // Location Manager methods
    
    func checkLocationServices() {
        if CLLocationManager.locationServicesEnabled() {
            setupLocationManager()
            checkLocationAuthorization()
        } else {
            // the user didn't turn it on
        }
    }
    
    func checkLocationAuthorization() {
        
        let authorizationStatus: CLAuthorizationStatus
        
        if #available(iOS 14, *) {
            authorizationStatus = locationManager.authorizationStatus
        } else {
            authorizationStatus = CLLocationManager.authorizationStatus()
        }
        
        switch authorizationStatus {
        case .authorizedWhenInUse:
            MapView.showsUserLocation = true
            followUserLocation()
            locationManager.startUpdatingLocation()
            break
        case .denied:
            // Show alert
            break
        case .notDetermined:
            locationManager.requestWhenInUseAuthorization()
        case .restricted:
            // Show alert
            break
        case .authorizedAlways:
            break
        default:
            break
        }
    }
    
    
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        checkLocationAuthorization()
    }
    
    func setupLocationManager() {
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
    }
    
    
    func followUserLocation() {
        if let location = locationManager.location?.coordinate {
            let region = MKCoordinateRegion.init(center: location, latitudinalMeters: 4000, longitudinalMeters: 4000)
            MapView.setRegion(region, animated: true)
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let myLocation = locations.last {
             print (myLocation)
            let region = MKCoordinateRegion(center: myLocation.coordinate, latitudinalMeters: 40000, longitudinalMeters: 40000)
             MapView.setRegion(region, animated: true)
        }
        
        
    }
}
