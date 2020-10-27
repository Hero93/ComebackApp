//
//  MapKitWalkTimeDistanceTracker.swift
//  ComebackApp
//
//  Created by Luca Gramaglia on 20/10/2020.
//

import MapKit

class MapKitWalkTimeDistanceCalculator: WalkTimeDistanceCalculator {
    
    func calculate(from sourcePlace: Place, to destinationPlace: Place, completion: @escaping (Result<TimeInterval, Error>) -> Void) {
        let request = MKDirections.Request()
        let sourcePlacemark = MKPlacemark(coordinate: CLLocationCoordinate2D(latitude: sourcePlace.coordinate.latitude,
                                                                             longitude: sourcePlace.coordinate.longitude),
                                          addressDictionary: nil)
        request.source = MKMapItem(placemark: sourcePlacemark)
        let destinationPlacemark = MKPlacemark(coordinate: CLLocationCoordinate2D(latitude: destinationPlace.coordinate.latitude,
                                                                                  longitude: destinationPlace.coordinate.longitude),
                                               addressDictionary: nil)
        request.destination = MKMapItem(placemark: destinationPlacemark)
        request.requestsAlternateRoutes = false
        request.transportType = .walking
        
        let directions = MKDirections(request: request)
        directions.calculate { (response, error) -> Void in
            
            guard let response = response else {
                if let error = error {
                    print("Error: \(error)")
                }
                return
            }
            
            if response.routes.count > 0 {
                guard let route = response.routes.first else { return }
                completion(.success(route.expectedTravelTime))
            }
        }
    }
}
