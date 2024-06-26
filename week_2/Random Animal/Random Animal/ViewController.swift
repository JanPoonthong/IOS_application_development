//
//  ViewController.swift
//  Random Animal
//
//  Created by Jan Poonthong on 15/6/2567 BE.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var animalLabel: UILabel!;
    @IBOutlet var animalImage: UIImageView!;
    
    var images: [String] = ["crab.jpg", "shark.jpg", "beaver.jpg", "ocra.jpg", "octopus.jpg", "turtle.jpg"]

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func randomAnimal() {
        let randomInt = Int.random(in: 0..<6)
        animalImage.image = UIImage(named: "\(images[randomInt])")
        let name = images[randomInt].components(separatedBy: ".")
        animalLabel.text = name[0]
    }


}

