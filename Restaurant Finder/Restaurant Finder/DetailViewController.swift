//
//  DetailViewController.swift
//  Restaurant Finder
//
//  Created by Kiratijuta Bhumichitr on 10/8/2567 BE.
//

import UIKit

var FAV_RESTAURANTS: [String: Bool] = [:]

class DetailViewController: UIViewController {
    
    var restaurant: Restaurant? = nil
    
    @IBOutlet var displayImage: UIImageView!
    @IBOutlet var displayName: UILabel!
    @IBOutlet var displayLocation: UILabel!
    @IBOutlet var displayRating: UILabel!
    @IBOutlet var displayTime: UILabel!
    @IBOutlet var displayPrice: UILabel!
    @IBOutlet var displayDescription: UILabel!
    
    @IBOutlet var favoriteButton: UIButton!
    
    @IBOutlet var start1: UIImageView!
    @IBOutlet var start2: UIImageView!
    @IBOutlet var start3: UIImageView!
    @IBOutlet var start4: UIImageView!
    @IBOutlet var start5: UIImageView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationController?.navigationBar.barTintColor = .white

        if let restaurant = restaurant {
            displayName.text = restaurant.name
            displayLocation.text = restaurant.location
            displayRating.text = "\(restaurant.rating)"
            displayTime.text = restaurant.openingTime
            displayPrice.text = restaurant.price
            displayImage.image = UIImage(named: restaurant.images[0])
            displayDescription.text = restaurant.description
            displayStars(numberOfRating: restaurant.rating)
            
            // Update favorite button based on global state
                        let isFavorite = FAV_RESTAURANTS[restaurant.name] ?? false
                        let imageName = isFavorite ? "heart.fill" : "heart"
                        favoriteButton.setImage(UIImage(systemName: imageName), for: .normal)
        }
    }
    
    func displayStars(numberOfRating: Double) {
        start1.isHidden = true
        start2.isHidden = true
        start3.isHidden = true
        start4.isHidden = true
        start5.isHidden = true
        
        if numberOfRating >= 1 {
            start1.isHidden = false
        }
        if numberOfRating >= 2 {
            start2.isHidden = false
        }
        if numberOfRating >= 3 {
            start3.isHidden = false
        }
        if numberOfRating >= 4 {
            start4.isHidden = false
        }
        if numberOfRating >= 5 {
            start5.isHidden = false
        }
    }
    
    @IBAction func favoriteClick() {
        guard let restaurantName = restaurant?.name else { return }
                
                let isFavorite = FAV_RESTAURANTS[restaurantName] ?? false
                FAV_RESTAURANTS[restaurantName] = !isFavorite
                
                let imageName = !isFavorite ? "heart.fill" : "heart"
                favoriteButton.setImage(UIImage(systemName: imageName), for: .normal)
        }
    }
    

