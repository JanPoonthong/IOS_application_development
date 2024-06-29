//
//  ViewController.swift
//  TextField Events
//
//  Created by Jan Poonthong on 29/6/2567 BE.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var phoneNumberTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func TextFieldOnEditingChanged(_ sender: Any) {
        if let currentInput = phoneNumberTextField.text {
            if currentInput.count >= 2 {
                let firstPart = currentInput.substring(to: currentInput.count - 1)
                let hyphen = "-"
                let lastPart = currentInput.substring(from: currentInput.count - 1)
                
                phoneNumberTextField    .text = "\(firstPart)\(hyphen)\(lastPart)"
            }
        }
    }
    
}

