//
//  ViewController.swift
//  API Requesting
//
//  Created by Jan Poonthong on 10/8/2567 BE.
//

import UIKit
import Alamofire

struct Person: Codable {
    var firstname: String
    var lastname: String
    var age: Int
    var gender: String
    var devices: [Device]
}

struct Device: Codable {
    var type: String
    var model: String
}

class ViewController: UIViewController {
    
    @IBOutlet weak var firstnameLabel: UILabel!
    @IBOutlet weak var ageLabel: UILabel!
    @IBOutlet weak var genderLabel: UILabel!
    @IBOutlet weak var lastnameLabel: UILabel!
    
    var person: Person? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        AF.request("https://dl.dropboxusercontent.com/s/u6oc4tionx16w41/profile.json").responseDecodable(of: Person.self) {data in
            switch data.result {
            case .success(let person):
                self.person = person
                self.updateUI()
            case .failure(let error):
                print(error)
            }
        }
    }
    
    func updateUI() {
        if let person = person {
            firstnameLabel.text = person.firstname
            lastnameLabel.text = person.lastname
            ageLabel.text = "\(person.age)"
            genderLabel.text = person.gender
            
            person.devices.forEach{ device in
                print(device.type)
                print(device.model)
            }
        }
    }


}

