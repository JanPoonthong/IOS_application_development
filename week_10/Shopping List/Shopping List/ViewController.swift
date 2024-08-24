//
//  ViewController.swift
//  Shopping List
//
//  Created by Jan Poonthong on 24/8/2567 BE.
//

import UIKit

class ViewController: UIViewController {
    
    var bools: [Bool] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        for _ in 0...99 {
            bools.append(Bool.random())
        }
    }
}

extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 100
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let itemIndex = indexPath.item
        let cellId = bools[itemIndex] ? "cell1" : "cell2"
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath)
        return cell
    }
}
