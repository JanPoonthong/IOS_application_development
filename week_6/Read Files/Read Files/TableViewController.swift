//
//  TableViewController.swift
//  Read Files
//
//  Created by Jan Poonthong on 13/7/2567 BE.
//

import UIKit

class TableViewController: UIViewController, UITableViewDataSource {
    
    var studentData: [Student] = []
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return studentData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = table.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! StudentTableViewCell
              cell.nameLabel.text = studentData[indexPath.row].name
        cell.ageLabel.text = String(studentData[indexPath.row].age)

        return cell
    }
    

    @IBOutlet weak var table: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        table.dataSource = self

        if let students = readJSONFile(named: "Students", withExtension: "json") {
            for student in students.students {
                studentData.append(Student(name: student.name, age: student.age))
                print("Name: \(student.name), Age: \(student.age)")
            }
        } else {
            print("Failed to load students data.")
        }

        
        

        // Do any additional setup after loading the view.
    }
    
    // Function to read JSON file
    func readJSONFile(named fileName: String, withExtension fileExtension: String) -> Students? {
        // Locate the file in the bundle
        if let fileURL = Bundle.main.url(forResource: fileName, withExtension: fileExtension) {
            do {
                // Read the data from the file
                let data = try Data(contentsOf: fileURL)
                // Decode the data to the Students struct
                let studentsData = try JSONDecoder().decode(Students.self, from: data)
                return studentsData
            } catch {
                print("Error reading or decoding file: \(error.localizedDescription)")
            }
        } else {
            print("File not found.")
        }
        return nil
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
