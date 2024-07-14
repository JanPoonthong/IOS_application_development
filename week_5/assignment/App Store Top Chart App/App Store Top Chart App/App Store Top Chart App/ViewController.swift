//
//  ViewController.swift
//  App Store Top Chart App
//
//  Created by Jan Poonthong on 11/7/2567 BE.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var table: UITableView!
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return topTenApps.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! AppTableViewCell
        cell.appName.text = topTenApps[indexPath.row].appName
        cell.labelDescription.text = topTenApps[indexPath.row].shortDescription
        cell.icon.image = UIImage(named: topTenApps[indexPath.row].appIcon)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let secondPage = UIStoryboard(name: "Main", bundle: .main).instantiateViewController(withIdentifier: "secondpage") as! EachAppViewController
        
        secondPage.detail = topTenApps[indexPath.row]
    
        navigationController?.pushViewController(secondPage, animated: true)
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        table.dataSource = self
        table.delegate = self
        
        navigationController?.navigationBar.prefersLargeTitles = true

    }


}

