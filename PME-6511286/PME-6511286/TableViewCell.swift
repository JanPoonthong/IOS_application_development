//
//  TableViewCell.swift
//  PME-6511286
//
//  Created by Jan Poonthong on 27/7/2567 BE.
//

import UIKit

class TableViewCell: UITableViewCell {

    @IBOutlet weak var restaurantName: UILabel!
    @IBOutlet weak var location: UILabel!
    @IBOutlet weak var rating: UILabel!
    @IBOutlet weak var price: UILabel!
    @IBOutlet weak var time: UILabel!
    @IBOutlet weak var Rimage: UIImageView!
    @IBOutlet weak var heartButton: UIButton!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
