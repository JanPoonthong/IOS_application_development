//
//  StudentTableViewCell.swift
//  Read Files
//
//  Created by Jan Poonthong on 13/7/2567 BE.
//

import UIKit

class StudentTableViewCell: UITableViewCell {

    @IBOutlet weak var ageLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
