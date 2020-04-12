
import Foundation
import CoreLocation

class LocationManager: NSObject {
    static let shared: LocationManager = { return LocationManager() }()

    var isEnabled: Bool {
        return CLLocationManager.locationServicesEnabled()
    }
    var currentLocation: CLLocation?
    var cityName: String?

    var isAuthorized: Bool {
        let status = CLLocationManager.authorizationStatus()
        return status == .authorizedAlways || status == .authorizedWhenInUse
    }
    
    private lazy var locationManager: CLLocationManager = {
        let locationManager = CLLocationManager()
        locationManager.distanceFilter = 1000
        locationManager.desiredAccuracy = kCLLocationAccuracyKilometer
        return locationManager
    }()
    
    private lazy var geocoder: CLGeocoder = {
        let geocoder = CLGeocoder()
        return geocoder
    }()
    
}

extension LocationManager {
    func start(force: Bool = false) {
        locationManager.delegate = self
        
        if force {
            locationManager.startUpdatingLocation()
            return
        }
        
        if !isEnabled {
            return
        }
        if isAuthorized {
            locationManager.startUpdatingLocation()
            return
        }
        
        locationManager.requestWhenInUseAuthorization()
    }
    
    func stop() {
        locationManager.stopUpdatingLocation()
    }
    
    func simulatedLocation() -> CLLocation {
        if((self.currentLocation) != nil){
            return self.currentLocation!
        }else{
            let location = CLLocation(latitude: 18.5204, longitude: 73.8567)
            self.geocoder.reverseGeocodeLocation(location) { placemarks, _ in
                guard let placemark = placemarks else { return }
                if let city = placemark.first?.locality!{
                    self.cityName = city
                }
            }
            return location
        }

    }
}

extension LocationManager: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        switch status {
        case .authorizedAlways,
             .authorizedWhenInUse:
            start(force: true)
        case .notDetermined,
             .denied,
             .restricted:
            stop()
        default:
            break
        }
        
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let location = locations.last, -location.timestamp.timeIntervalSinceNow < 60 { /// Ignore the cached location.

            self.geocoder.reverseGeocodeLocation(location) { placemarks, _ in
                guard let placemark = placemarks else { return }
                if let city = placemarks?.first?.locality!{
                    self.cityName = city
                }
                self.currentLocation = location
                NotificationCenter.default.post(name: .currentLocationChanged, object: nil)
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        if let locationError = error as? CLError, locationError.code == .denied {
            stop()
        }
    }
  }

}
