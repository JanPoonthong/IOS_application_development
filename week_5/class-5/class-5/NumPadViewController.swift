//
//  ViewController.swift
//  class-5
//
//  Created by Jan Poonthong on 6/7/2567 BE.
//

import UIKit

class NumPadViewController: UIViewController {
    
    @IBOutlet weak var oneLabel: UILabel!
    @IBOutlet weak var secondLabel: UILabel!
    @IBOutlet weak var thirdLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        oneLabel.layer.cornerRadius = oneLabel.frame.height / 2
        secondLabel.layer.cornerRadius = oneLabel.frame.height / 2
        thirdLabel.layer.cornerRadius = oneLabel.frame.height / 2

    }


}

