//
//  TableTableViewCell.swift
//  grade_list
//
//  Created by Jan Poonthong on 17/8/2567 BE.
//

import UIKit

class TableTableViewCell: UITableViewCell {
    
    @IBOutlet weak var subjectName: UILabel!
    @IBOutlet weak var gradeLabel: UILabel!
    @IBOutlet weak var credit: UILabel!
    @IBOutlet weak var courseCode: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
