

import UIKit
import CoreLocation

class LocationManager: NSObject, CLLocationManagerDelegate {
    static let shared = LocationManager()
    
    let manager = CLLocationManager()
    var complition: ((CLLocation)-> Void)?
    
    func getUserLocation(complition: @escaping ((CLLocation)-> Void)){
        self.complition = complition
        manager.requestWhenInUseAuthorization()
        manager.delegate = self
        manager.desiredAccuracy = kCLLocationAccuracyBest
        manager.startUpdatingLocation()
    }
    
    
    func resolveLocationName(with location: CLLocation, completion: @escaping ((String?) -> Void)){
        let geocoder = CLGeocoder()
        geocoder.reverseGeocodeLocation(location, preferredLocale: .current) { (placemarks, error) in
            guard let place = placemarks?.first, error == nil else{
                completion(nil)
                return
            }
            var name = ""
            if let locality = place.locality{
                name += locality
            }
            completion(name)
        }
       
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location = locations.first else {return}
        complition?(location)
        manager.stopUpdatingLocation()
    }
}
