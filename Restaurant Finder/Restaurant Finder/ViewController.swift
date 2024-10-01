//
//  ViewController.swift
//  Restaurant Finder
//
//  Created by Kiratijuta Bhumichitr on 10/8/2567 BE.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!

    var restaurants: [Restaurant] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.

        if let result = readJSONFile(named: "Restaurants", withExtension: "json") {
            restaurants = result.restaurants
        }
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        // Reload the table view to ensure all cells are updated
        tableView.reloadData()
    }

    func readJSONFile(named fileName: String, withExtension fileExtension: String)
        -> RestaurantClass?
    {
        // Locate the file in the bundle
        if let fileURL = Bundle.main.url(forResource: fileName, withExtension: fileExtension) {
            do {
                // Read the data from the file
                let data = try Data(contentsOf: fileURL)
                // Decode the data to the AppInfo struct
                let appInfo = try JSONDecoder().decode(RestaurantClass.self, from: data)
                return appInfo
            } catch {
                print("Error reading or decoding file: \(error.localizedDescription)")
            }
        } else {
            print("File not found.")
        }
        return nil
    }

}

extension ViewController: UITableViewDelegate, UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return restaurants.count
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 300
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let i = indexPath.row

        let cell =
            tableView.dequeueReusableCell(withIdentifier: "restaurantcell") as! RestaurantCell
        cell.displayName.text = restaurants[i].name
        cell.displayLocation.text = restaurants[i].location
        cell.displayRating.text = "\(restaurants[i].rating)"
        cell.displayTime.text = restaurants[i].openingTime
        cell.displayPrice.text = restaurants[i].price
        cell.displayImage.image = UIImage(named: restaurants[i].images[0])
        cell.displayStars(numberOfRating: restaurants[i].rating)

        let restaurant = restaurants[indexPath.row]

        let isFavorite = FAV_RESTAURANTS[restaurant.name] ?? false
        let heartImageName = isFavorite ? "heart.fill" : "heart"
        cell.HeartImage.image = UIImage(systemName: heartImageName)

        return cell

    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let detailScene =
            storyboard?.instantiateViewController(identifier: "detailviewcontroller")
            as! DetailViewController
        detailScene.restaurant = restaurants[indexPath.row]

        navigationController?.pushViewController(detailScene, animated: true)
        self.navigationController?.navigationBar.barTintColor = .white
    }

}
