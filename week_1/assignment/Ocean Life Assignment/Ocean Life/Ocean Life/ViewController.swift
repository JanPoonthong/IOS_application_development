//
//  ViewController.swift
//  Ocean Life
//
//  Created by Jan Poonthong on 9/6/2567 BE.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var crabImg: UIImageView!;
    @IBOutlet var beaverImg: UIImageView!;
    @IBOutlet var turtleImg: UIImageView!;
    @IBOutlet var sharkImg: UIImageView!;
    @IBOutlet var orcaImg: UIImageView!;
    @IBOutlet var octopusImg: UIImageView!;
    @IBOutlet var animalName: UILabel!;


    override func viewDidLoad() {
        super.viewDidLoad()
    
    }


    @IBAction func animalClicked(button: UIButton) {
        let id = button.tag
        
        if id == 1 {
            animalName.text = "Crab"
        } else if id == 2 {
            animalName.text = "Beaver"
        } else if id == 3 {
            animalName.text = "Turtle"
        } else if id == 4 {
            animalName.text = "Shark"
        } else if id == 5 {
            animalName.text = "Orca"
        } else if id == 6 {
            animalName.text = "Octopus"
        }
    }
    

}
