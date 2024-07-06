//
//  DetailViewController.swift
//  class-5
//
//  Created by Jan Poonthong on 6/7/2567 BE.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var label: UILabel!
    
    var detail: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()

        label.text = detail
        // Do any additional setup after loading the view.
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
