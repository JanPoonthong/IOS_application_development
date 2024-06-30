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
                if currentInput.count == 3 {
                    let firstPart = currentInput
                    let hyphen = "-"
                    
                    phoneNumberTextField    .text = "\(firstPart)\(hyphen)"
                }
                if currentInput.count == 7 {
                    let firstPart = currentInput
                    let hyphen = "-"
                    phoneNumberTextField    .text = "\(firstPart)\(hyphen)"
                }
                if currentInput.count >= 13 {
                    phoneNumberTextField.text = currentInput.substring(to: 12)
                    phoneNumberTextField.resignFirstResponder()
                }
            }
    }
    
    @IBAction func textFieldOnEditingBegin(_ sender: Any) {
        print("textFieldOnEditingBegin")
    }
    
    @IBAction func imDoneButtonClicked(_ sender: Any) {
        phoneNumberTextField.resignFirstResponder()
    }
}

