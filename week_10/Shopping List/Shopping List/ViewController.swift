//
//  ViewController.swift
//  Shopping List
//
//  Created by Jan Poonthong on 24/8/2567 BE.
//

import UIKit

class ViewController: UIViewController {
    
    var products: [(img: String, name: String, price: String)] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        products.append((img: "air", name: "Macbook Air", price: "$999.0"))
        products.append(("mbpro", "Macbook Pro", "$1299.0"))
        products.append(("ipadpro", "iPad Pro", "$799.0"))
        products.append(("ipadpro", "iPad Air", "$599.0"))
        products.append(("ipadmini", "iPad mini", "$399.0"))
        products.append(("applewatch", "Apple Watch", "$499.0"))
    }
}

extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return products.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let itemIndex = indexPath.item
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "shopping_item", for: indexPath) as! ShoppingCell
        
        cell.productImageView.image = UIImage(named: products[itemIndex].img)
        cell.productNameLabel.text = products[itemIndex].name
        cell.productPriceLabel.text = products[itemIndex].price
        return cell
    }
}
