//
//  ViewController.swift
//  Planet List
//
//  Created by Jan Poonthong on 24/8/2567 BE.
//

import UIKit

class ViewController: UIViewController {
    
    var planets: [(img: String, name: String)] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        planets.append((img: "earth", name: "Earth"))
        planets.append(("mars", "Mars"))
        planets.append(("venus", "Venus"))
        planets.append(("saturn", "Saturn"))
        planets.append(("jupiter", "Jupiter"))
        planets.append(("mercury", "Mercury"))
        planets.append(("uranus", "Uranus"))
        planets.append(("neptune", "Neptune"))

    }
}

extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return planets.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let itemIndex = indexPath.item
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! PlanetCell
        
        cell.productImageView.image = UIImage(named: planets[itemIndex].img)
        cell.productNameLabel.text = planets[itemIndex].name
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let secondPage = UIStoryboard(name: "Main", bundle: .main).instantiateViewController(withIdentifier: "secondpage") as! SeoncdViewController
        
        secondPage.info = planets[indexPath.row]
    
        navigationController?.pushViewController(secondPage, animated: true)
    }
}
