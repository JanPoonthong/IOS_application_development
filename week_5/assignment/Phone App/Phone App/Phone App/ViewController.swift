//
//  ViewController.swift
//  Phone App
//
//  Created by Jan Poonthong on 9/7/2567 BE.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var oneButton: UIButton!
    @IBOutlet weak var secondButton: UIButton!
    @IBOutlet weak var thirdButton: UIButton!
    @IBOutlet weak var fourthButton: UIButton!
    @IBOutlet weak var fifthButton: UIButton!
    @IBOutlet weak var sixthButton: UIButton!
    @IBOutlet weak var seventhButton: UIButton!
    @IBOutlet weak var eighthButton: UIButton!
    @IBOutlet weak var ninthButton: UIButton!
    @IBOutlet weak var hashButton: UIButton!
    @IBOutlet weak var starButton: UIButton!
    @IBOutlet weak var zerothButton: UIButton!
    @IBOutlet weak var callButton: UIButton!
    @IBOutlet weak var label: UILabel!
    
    func setCircle(button: UIButton) {
        button.layer.cornerRadius = button.frame.height / 2
        button.layer.masksToBounds = true
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setCircle(button: oneButton)
        setCircle(button: secondButton)
        setCircle(button: thirdButton)
        setCircle(button: fourthButton)
        setCircle(button: fifthButton)
        setCircle(button: sixthButton)
        setCircle(button: seventhButton)
        setCircle(button: eighthButton)
        setCircle(button: ninthButton)
        setCircle(button: hashButton)
        setCircle(button: starButton)
        setCircle(button: zerothButton)
        setCircle(button: callButton)
    }
    
    
    @IBAction func clicked(_ sender: UIButton) {
        label.text! += sender.titleLabel!.text!
    }

    @IBAction func deleteClicked(_ sender: Any) {
        if var text = label.text, !text.isEmpty {
                text.removeLast()
                label.text = text
            }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destination = segue.destination as! CallingViewController;
        destination.phoneNumber = label.text!
    }
}

