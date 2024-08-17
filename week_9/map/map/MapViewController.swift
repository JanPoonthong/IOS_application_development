//
//  MapViewController.swift
//  map
//
//  Created by Jan Poonthong on 17/8/2567 BE.
//

import UIKit
import MapKit

class MapViewController: UIViewController, MKMapViewDelegate {

    @IBOutlet weak var mapView: MKMapView!
    
    var AUPlaces: [AUPlace] = []

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        mapView.delegate = self
        setInitialLocation()
        loadLocationData()
        addAnnotations()

    }
    
    // Step 1: Set Initial Map Location
        func setInitialLocation() {
            let initialLocation = CLLocationCoordinate2D(latitude: 13.612320, longitude: 100.836808)
            let region = MKCoordinateRegion(center: initialLocation, latitudinalMeters: 1000, longitudinalMeters: 1000)
            mapView.setRegion(region, animated: true)
        }
        
        // Step 2: Parse JSON Data
        func loadLocationData() {
            if let result = readJSONFile(named: "abac_location", withExtension: "json") {
                AUPlaces = result.locations
            }
        }
    
    func readJSONFile(named fileName: String, withExtension fileExtension: String) -> AUPlaceClass? {
        if let fileURL = Bundle.main.url(forResource: fileName, withExtension: fileExtension) {
            do {
                let data = try Data(contentsOf: fileURL)
                let appInfo = try JSONDecoder().decode(AUPlaceClass.self, from: data)
                return appInfo
            } catch {
                print("Error reading or decoding file: \(error.localizedDescription)")
            }
        } else {
            print("File not found.")
        }
        return nil
    }
    
    // Step 3: Add Annotations
    func addAnnotations() {
        for place in AUPlaces {
            let annotation = MKPointAnnotation()
            annotation.title = place.FacultyName
            annotation.subtitle = place.Abbreviation
            annotation.coordinate = CLLocationCoordinate2D(latitude: place.LocationLat, longitude: place.LocationLong)
            mapView.addAnnotation(annotation)
        }
    }

    // Step 4: Customize Callout with Detail Button
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        let identifier = "AUPlacePin"
        var annotationView = mapView.dequeueReusableAnnotationView(withIdentifier: identifier)
        
        if annotationView == nil {
            annotationView = MKPinAnnotationView(annotation: annotation, reuseIdentifier: identifier)
            annotationView?.canShowCallout = true
            
            let detailButton = UIButton(type: .detailDisclosure)
            annotationView?.rightCalloutAccessoryView = detailButton
        } else {
            annotationView?.annotation = annotation
        }
        
        return annotationView
    }
    
    // Handle tap on callout detail button
    func mapView(_ mapView: MKMapView, annotationView view: MKAnnotationView, calloutAccessoryControlTapped control: UIControl) {
        if let annotation = view.annotation {
            showAlert(for: annotation)
        }
    }
    
    // Show alert with faculty name and coordinates
    func showAlert(for annotation: MKAnnotation) {
        let title = annotation.title ?? "Unknown Place"
        let coordinate = annotation.coordinate
        let message = "Coordinates: \(coordinate.latitude), \(coordinate.longitude)"
        
        let alertController = UIAlertController(
            title: title,
            message: message,
            preferredStyle: .alert
        )
        
        let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alertController.addAction(okAction)
        
        present(alertController, animated: true, completion: nil)
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
