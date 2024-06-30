//
//  ViewController.swift
//  TextField Event with Thai Citizen ID Number Formatting
//
//  Created by Jan Poonthong on 30/6/2567 BE.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var citizenID: UITextField!
    
    @IBOutlet weak var button: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func onChange(_ sender: Any) {
        if let currentInput = citizenID.text {
            switch (currentInput.count) {
            case 1: citizenID.text = citizenID.text! + "-"
            case 6: citizenID.text = citizenID.text! + "-"
            case 13: citizenID.text = citizenID.text! + "-"
            case 16: citizenID.text = citizenID.text! + "-"
            default: break
            }
        }
    }
    @IBAction func buttonClicked(_ sender: Any) {
        citizenID.resignFirstResponder()
    }
}
    

