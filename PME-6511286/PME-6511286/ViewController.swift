//
//  ViewController.swift
//  PME-6511286
//
//  Created by Jan Poonthong on 27/7/2567 BE.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var table: UITableView!
    
    var restaurantData: [Restaurant] = []
    
    var heartState: Bool = false
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return restaurantData.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! TableViewCell
        cell.restaurantName.text = restaurantData[indexPath.row].name
        cell.location.text = restaurantData[indexPath.row].location
        cell.price.text = restaurantData[indexPath.row].price
        cell.time.text = restaurantData[indexPath.row].openingTime
        cell.rating.text = String(restaurantData[indexPath.row].rating)
        cell.Rimage?.image = UIImage(named: restaurantData[indexPath.row].images[0])
        

        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
    
    @IBAction func heartButtonClicked(_ sender: Any) {
        heartState = true
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let secondPage = UIStoryboard(name: "Main", bundle: .main).instantiateViewController(withIdentifier: "secondpage") as! SecondViewController
        secondPage.restaurant = restaurantData[indexPath.row]
        navigationController?.pushViewController(secondPage, animated: true)
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        table.dataSource = self
        table.delegate = self

        
//        guard readJSONFile(named: "Restaurants", withExtension: "json") != nil else {
//            return
//        }
        
        if let restaurants = readJSONFile(named: "Restaurants", withExtension: "json") {
            for restaurant in restaurants.restaurants {
                restaurantData.append(Restaurant(name: restaurant.name, location: restaurant.location, description: restaurant.description, rating: restaurant.rating, openingTime: restaurant.openingTime, price: restaurant.price, images: restaurant.images))
                print("Name: \(restaurant.name), Location: \(restaurant.location)")
            }
        } else {
            print("Failed to load students data.")
        }
        
        
//        print(jsonContent)
    }
    
    func readJSONFile(named fileName: String, withExtension fileExtension: String) -> Restaurants? {
        // Locate the file in the bundle
        if let fileURL = Bundle.main.url(forResource: fileName, withExtension: fileExtension) {
            do {
                // Read the data from the file
                let data = try Data(contentsOf: fileURL)
                // Decode the data to the Restaurants struct
                let restaurants = try JSONDecoder().decode(Restaurants.self, from: data)
                return restaurants
            } catch {
                print("Error reading or decoding file: \(error.localizedDescription)")
            }
        } else {
            print("File not found.")
        }
        return nil
    }



}

