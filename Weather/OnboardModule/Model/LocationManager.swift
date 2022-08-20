//
//  LocationManager.swift
//  Weather
//
//  Created by Michael Khavin on 20.08.2022.
//

import CoreLocation

protocol LocationManagerProtocol {
    func requestLocationAuthorization()
}

class LocationManager: NSObject, LocationManagerProtocol {
    private lazy var locationManager: CLLocationManager = {
        let manager = CLLocationManager()
        manager.delegate = self
        return manager
    }()
    
    func requestLocationAuthorization() {        
        guard CLLocationManager.significantLocationChangeMonitoringAvailable() else {
            return
        }
        
        locationManager.requestWhenInUseAuthorization()
    }
}

extension LocationManager: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, monitoringDidFailFor region: CLRegion?, withError error: Error) {
        
    }
    
    @available(iOS 14, *)
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        authorizationStatusDidChange(manager.authorizationStatus)
    }
    
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        authorizationStatusDidChange(status)
    }
    
    func authorizationStatusDidChange(_ status: CLAuthorizationStatus) {
        switch status {
        case .notDetermined:
            break
        case .restricted, .denied:
            print("restricted")
        case .authorizedAlways, .authorizedWhenInUse:
            print("authorized")
        @unknown default:
            break
        }
    }
}
