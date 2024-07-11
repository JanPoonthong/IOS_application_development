//
//  CallingViewController.swift
//  Phone App
//
//  Created by Jan Poonthong on 11/7/2567 BE.
//

import UIKit

class CallingViewController: UIViewController {
    
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var endCallButton: UIButton!
    
    var phoneNumber: String = ""

    override func viewDidLoad() {
        super.viewDidLoad()
        label.text = phoneNumber
        
        endCallButton.layer.cornerRadius = endCallButton.frame.height / 2
        endCallButton.layer.masksToBounds = true
    }
    
    @IBAction func dismiss(_ sender: Any) {
        self.dismiss(animated: true)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
