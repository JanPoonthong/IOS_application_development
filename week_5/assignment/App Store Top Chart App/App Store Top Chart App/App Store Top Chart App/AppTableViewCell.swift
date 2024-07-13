//
//  AppTableViewCell.swift
//  App Store Top Chart App
//
//  Created by Jan Poonthong on 12/7/2567 BE.
//

import UIKit

class AppTableViewCell: UITableViewCell {


    @IBOutlet weak var appName: UILabel!
    @IBOutlet weak var labelDescription: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
