import SwiftUI
import Foundation
import CoreLocation

//This class below is to manage everything related to location
class LocationManager: NSObject, ObservableObject, CLLocationManagerDelegate
{
    let manager = CLLocationManager()
    
    //Line below gets location ('?' means its optional)
    @Published var location: CLLocationCoordinate2D?
    @Published var isLoading = false
    
    override init() {
        super.init()
        manager.delegate = self
    }
    
    func requestLocation()
    {
        isLoading = true
        manager.requestLocation()
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation])
    {
        location = locations.first?.coordinate
        isLoading = false    //got location so state not loading anymore
    }
    
    //func to handle Errors
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error)
    {
        print("where u @? Error getting location", error)
        isLoading = false
    }
}
