//
//  ViewController.swift
//  First App
//
//  Created by Jan Poonthong on 8/6/2567 BE.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var greetingMessage: UILabel!
    @IBOutlet var nameInput: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func clickMeButtonClicked() {
        
        let name = nameInput.text;
        
        if name != "" {
            greetingMessage.text = "Hello \(name!)"
            greetingMessage.textColor = #colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1)
        }
    }

}

