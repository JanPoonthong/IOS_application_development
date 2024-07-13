//
//  ViewController.swift
//  Basic Info with UserDefault
//
//  Created by Jan Poonthong on 13/7/2567 BE.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var nameInput: UITextField!
    @IBOutlet weak var ageInput: UITextField!
    @IBOutlet weak var emailInput: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        if let name = UserDefaults.standard.string(forKey: "name") {
            nameInput.text = name
        }
        if let age = UserDefaults.standard.string(forKey: "age") {
            ageInput.text = age
        }
        if let email = UserDefaults.standard.string(forKey: "email") {
            emailInput.text = email
        }
    }

    @IBAction func saveButtonClicked(_ sender: Any) {
        let name = nameInput.text ?? ""
        let age = ageInput.text ?? ""
        let email = emailInput.text ?? ""
        
        UserDefaults.standard.set(name, forKey: "name")
        UserDefaults.standard.set(age, forKey: "age")
        UserDefaults.standard.set(email, forKey: "email")
    }
    
}

