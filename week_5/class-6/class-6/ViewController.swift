//
//  ViewController.swift
//  class-6
//
//  Created by Jan Poonthong on 6/7/2567 BE.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    let courses: [Course] = [Course(title: "English 1", grade: "A"), Course(title: "iOS App Development", grade: "A"), Course(title: "Business Intelligence", grade: "B"), Course(title: "User Interface Design", grade: "C")]
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return courses.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! GradeTableViewCell
        cell.course.text = courses[indexPath.row].title
        cell.grade.text = courses[indexPath.row].grade
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 140
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let thirdpage = UIStoryboard(name: "Main", bundle: .main).instantiateViewController(withIdentifier: "thirdpage") as! ThirdPageViewController
        thirdpage.course = courses[indexPath.row]
        navigationController?.pushViewController(thirdpage, animated: true)
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
        tableView.contentInset = UIEdgeInsets(top: 60, left: 0, bottom: 0, right: 0)
        tableView.separatorStyle = .none
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

