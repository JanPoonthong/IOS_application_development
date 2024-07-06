//
//  GradeTableViewCell.swift
//  class-6
//
//  Created by Jan Poonthong on 6/7/2567 BE.
//

import UIKit

class GradeTableViewCell: UITableViewCell {

    @IBOutlet weak var course: UILabel!
    @IBOutlet weak var grade: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        grade.textColor = .red
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
