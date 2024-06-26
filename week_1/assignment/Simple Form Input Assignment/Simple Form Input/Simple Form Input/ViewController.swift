//
//  ViewController.swift
//  Simple Form Input
//
//  Created by Jan Poonthong on 11/6/2567 BE.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var displayFullName: UILabel!;
    @IBOutlet var displayAge: UILabel!;

    @IBOutlet var firstName: UITextField!;
    @IBOutlet var lastName: UITextField!;
    @IBOutlet var age: UITextField!;
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func buttonClicked() {
        if (firstName.text != "" && lastName.text != "" && age.text != "") {
            let fullName = "\(firstName.text!) \(lastName.text!)"
            
            displayFullName.text = "Your name is \(fullName)."
            displayAge.text = "You are \(age.text!) years old."
        }
    }
}

