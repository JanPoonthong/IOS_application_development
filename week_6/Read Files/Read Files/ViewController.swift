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
        
        if let content = readTextFile(named: "Configuration", withExtension: "txt") {
            let configs : [String] = content.components(separatedBy: ",")
            
            switch configs[0] {
            case "Red":
                view.backgroundColor = .red
                universityName.text = configs[2]
                appName.text = configs[1]
            case "Blue":
                view.backgroundColor = .blue
                universityName.text = configs[2]
                appName.text = configs[1]
            case "Yello":
                view.backgroundColor = .yellow
                universityName.text = configs[2]
                appName.text = configs[1]
            default:
                view.backgroundColor = .black
            }
        }
        
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

