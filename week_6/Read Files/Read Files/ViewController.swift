//
//  ViewController.swift
//  Read Files
//
//  Created by Jan Poonthong on 13/7/2567 BE.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var appName: UILabel!
    @IBOutlet weak var universityName: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        guard let txtContent = readTextFile(named: "Configuration", withExtension: "txt") else {
            return
        }
                
        guard let jsonContent = readJSONFile(named: "Configuration", withExtension: "json") else {
            return
        }
        
            let configs : [String] = txtContent.components(separatedBy: ",")
            
        switch jsonContent.color {
            case "Red":
                view.backgroundColor = .red
            case "Blue":
                view.backgroundColor = .blue
            case "Yello":
                view.backgroundColor = .yellow
                
            default:
                view.backgroundColor = .black
            }
        
        universityName.text = jsonContent.university
        appName.text =  jsonContent.app
        
        
    }
    
    // Function to read JSON file from the app bundle
    func readJSONFile(named fileName: String, withExtension fileExtension: String) -> AppInfo? {
        // Locate the file in the bundle
        if let fileURL = Bundle.main.url(forResource: fileName, withExtension: fileExtension) {
            do {
                // Read the data from the file
                let data = try Data(contentsOf: fileURL)
                // Decode the data to the AppInfo struct
                let appInfo = try JSONDecoder().decode(AppInfo.self, from: data)
                return appInfo
            } catch {
                print("Error reading or decoding file: \(error.localizedDescription)")
            }
        } else {
            print("File not found.")
        }
        return nil
    }
    
    func readTextFile(named fileName: String, withExtension fileExtension: String) -> String? {
        // Locate the file in the bundle
        if let fileURL = Bundle.main.url(forResource: fileName, withExtension: fileExtension) {
            do {
                // Read the contents of the file
                let fileContents = try String(contentsOf: fileURL, encoding: .utf8)
                return fileContents
            } catch {
                print("Error reading file: \(error.localizedDescription)")
            }
        } else {
            print("File not found.")
        }
        return nil
    }


}

