//
//  SeoncdViewController.swift
//  Planet List
//
//  Created by Jan Poonthong on 24/8/2567 BE.
//

import UIKit

class SeoncdViewController: UIViewController {
    
    var info: (img: String, name: String)?

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var image: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        nameLabel.text = info?.name
        image.image = UIImage(named: info?.img ?? "None")
        
        print("Image and name are set")
        
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
