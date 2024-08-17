//
//  LocationCell.swift
//  map
//
//  Created by Jan Poonthong on 17/8/2567 BE.
//

import UIKit

class AUPlaceCell: UITableViewCell {

    @IBOutlet weak var AULogo: UIImageView!
    @IBOutlet weak var AUDistance: UILabel!
    @IBOutlet weak var AUName: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
