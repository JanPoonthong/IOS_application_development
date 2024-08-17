//
//  MapViewController.swift
//  map
//
//  Created by Jan Poonthong on 17/8/2567 BE.
//

import UIKit
import MapKit

class MapViewController: UIViewController {

    @IBOutlet weak var mapView: MKMapView!
    
    var AUPlaces: [AUPlace] = []

    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        if let result = readJSONFile(named: "abac_location", withExtension: "json") {
                AUPlaces = result.locations
                
                for place in AUPlaces {
                    let annotation = MKPointAnnotation()
                    annotation.title = place.FacultyName
                    annotation.subtitle = place.Abbreviation
                    annotation.coordinate = CLLocationCoordinate2D(latitude: place.LocationLat, longitude: place.LocationLong)
                    mapView.addAnnotation(annotation)
                }
            }
    }
    
    @IBAction func showAlertButtonTapped(_ sender: UIButton) {
            guard let place = AUPlaces.first else { return } // For demonstration, using the first place
            
            let alertController = UIAlertController(
                title: place.FacultyName,
                message: "Coordinates: \(place.LocationLat), \(place.LocationLong)",
                preferredStyle: .alert
            )
            
            let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
            alertController.addAction(okAction)
            
            present(alertController, animated: true, completion: nil)
        }
    
    func readJSONFile(named fileName: String, withExtension fileExtension: String) -> AUPlaceClass? {
        // Locate the file in the bundle
        if let fileURL = Bundle.main.url(forResource: fileName, withExtension: fileExtension) {
            do {
                // Read the data from the file
                let data = try Data(contentsOf: fileURL)
                // Decode the data to the AppInfo struct
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
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
