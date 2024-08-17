//
//  ViewController.swift
//  map
//
//  Created by Jan Poonthong on 17/8/2567 BE.
//

import UIKit
import CoreLocation

class ViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var AUPlaces: [AUPlace] = []


    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        if let result = readJSONFile(named: "abac_location", withExtension: "json") {
            AUPlaces = result.locations
        }
        tableView.delegate = self
        tableView.dataSource = self
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


}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return AUPlaces.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let i = indexPath.row
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "auplacecell") as! AUPlaceCell
        
        cell.AULogo.image = UIImage(named: AUPlaces[i].ImageLogoName)
        cell.AUName.text = AUPlaces[i].FacultyName
        let distance = calculateDistance(
            from: CLLocation(latitude: 13.612320, longitude: 100.836808),
            to: CLLocation(latitude: AUPlaces[i].LocationLat, longitude: AUPlaces[i].LocationLong)
        )
        cell.AUDistance.text = String(format: "%.2f meters", distance)
        return cell
    }
    
    func calculateDistance(from location1: CLLocation, to location2: CLLocation) -> CLLocationDistance {
        return location1.distance(from: location2)
    }
    
}

