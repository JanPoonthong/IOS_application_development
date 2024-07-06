//
//  ThirdPageViewController.swift
//  class-6
//
//  Created by Jan Poonthong on 6/7/2567 BE.
//

import UIKit

class ThirdPageViewController: UIViewController {

    @IBOutlet weak var courseLabel: UILabel!
    
    var course: Course?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        courseLabel.text = course?.title

        // Do any additional setup after loading the view.
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
