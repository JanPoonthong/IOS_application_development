//
//  ViewController.swift
//  App Store Top Chart App
//
//  Created by Jan Poonthong on 11/7/2567 BE.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        topTenApps.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! AppTableViewCell
        cell.appName.text = topTenApps[indexPath.row].appName
        cell.labelDescription.text = topTenApps[indexPath.row].shortDescription
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 10
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let apperance = UINavigationBarAppearance()
        navigationController?.navigationBar.prefersLargeTitles = true

    }


}

