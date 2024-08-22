import UIKit
import Alamofire

struct Student: Decodable {
    let name: String
    let grades: [Grade]
}

struct Grade: Decodable {
    let code: String
    let credit: Double
    let name: String
    let grade: String
}

class ViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var students: Student? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Set the delegate and data source
        tableView.delegate = self
        tableView.dataSource = self
        
        // Fetch data from the API
        AF.request("https://dl.dropboxusercontent.com/s/nsicnigp0xc8dxz/grades.json").responseDecodable(of: Student.self) { response in
            switch response.result {
            case .success(let students):
                self.students = students
                self.tableView.reloadData() // Reload the table view to display the new data
            case .failure(let error):
                print(error)
            }
        }
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return students?.grades.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "table", for: indexPath) as! TableTableViewCell
        
        if let grade = students?.grades[indexPath.row] {
            cell.subjectName.text = grade.name
            cell.credit.text = "\(grade.credit) CR."
            cell.gradeLabel.text = grade.grade
            cell.courseCode.text = grade.code
        }
        
        return cell
    }
}
