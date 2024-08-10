//
//  SecondViewController.swift
//  PME-6511286
//
//  Created by Jan Poonthong on 27/7/2567 BE.
//

import UIKit

class SecondViewController: UIViewController {
    var restaurant: Restaurant?

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var ratingLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var viewUI: UIView!
    
    @IBOutlet weak var heartButtonInSecond: UIButton!
    
    var heartStateInSecond: Bool?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        let heartImage = UIImage(systemName: "heart")
//        let heartFillImage = UIImage(systemName: "heart.fill")
//        
//        heartButtonInSecond.setImage(heartStateInSecond! ? heartFillImage : heartImage, for: .normal)


        guard let restaurant = restaurant else { return }

        if let imageName = restaurant.images.first {
            imageView.image = UIImage(named: imageName)
        }

        ratingLabel.text = String(restaurant.rating)
        priceLabel.text = restaurant.price
        timeLabel.text = restaurant.openingTime
        locationLabel.text = restaurant.location
        nameLabel.text = restaurant.name
        descriptionLabel.text = restaurant.description
        
        // Define star image view properties
                let starSize: CGFloat = 26
                let starSpacing: CGFloat = 5
                let initialX: CGFloat = 0
                let initialY: CGFloat = 0

                // Loop to create and add star image views
        for i in 0..<Int(restaurant.rating) {
                    let starImageView = UIImageView()
                    
                    // Load the star image
                    if let starImage = UIImage(named: "star.fill") {
                        starImageView.image = starImage
                    } else {
                        // Use a system image as a fallback
                        starImageView.image = UIImage(systemName: "star")
                        print("Failed to load custom image named 'star'")
                    }
                    
                    // Set image view properties
                    starImageView.tintColor = .systemYellow
                    starImageView.contentMode = .scaleAspectFit
                    let x = initialX + CGFloat(i) * (starSize + starSpacing)
                    starImageView.frame = CGRect(x: x, y: initialY, width: starSize, height: starSize)

                    // Add image view to the view
                    viewUI.addSubview(starImageView)
                }

        // Do any additional setup after loading the view.
    }
}


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */


