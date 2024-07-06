//
//  ViewController.swift
//  class-6
//
//  Created by Jan Poonthong on 6/7/2567 BE.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! GradeTableViewCell
        cell.course.text = "iOS App Development"
        cell.grade.text = "A"
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 140
    }
    

    @IBOutlet weak var tableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let apperance = UINavigationBarAppearance()
        apperance.backgroundColor = .orange
        apperance.titleTextAttributes = [.foregroundColor: UIColor.green]
        apperance.largeTitleTextAttributes = [.foregroundColor: UIColor.purple]
        
        
        navigationController?.navigationBar.prefersLargeTitles = false
        navigationController?.navigationBar.scrollEdgeAppearance = apperance
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: .add, style: .plain, target: self, action: #selector(addClicked))
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Edit", style: .plain, target: self, action: #selector(editClicked))
        
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    @objc func editClicked() {
        let thirdpage = UIStoryboard(name: "Main", bundle: .main).instantiateViewController(withIdentifier: "thirdpage") as! ThirdPageViewController
        navigationController?.pushViewController(thirdpage, animated: true)
    }
    
    @objc func addClicked() {
        
    }

    @IBAction func nextClicked(_ sender: Any) {
        let secondPage = UIStoryboard(name: "Main", bundle: .main).instantiateViewController(withIdentifier: "secondpage") as! SecondPageViewController
        
        navigationController?.pushViewController(secondPage, animated: true)
    }
    
}

