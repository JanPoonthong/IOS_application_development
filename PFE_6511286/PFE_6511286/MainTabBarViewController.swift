//
//  ViewController.swift
//  Netflix Clone
//
//  Created by Jan Poonthong on 30/9/2567 BE.
//

import UIKit

class MainTabBarViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground

        let vc1 = UINavigationController(rootViewController: ViewController())
        let vc2 = UINavigationController(rootViewController: CinemasViewController())

        vc1.tabBarItem.image = UIImage(systemName: "movieclapper")
        vc2.tabBarItem.image = UIImage(systemName: "location")

        vc1.title = "Movies"
        vc2.title = "Cinemas"

        tabBar.tintColor = .label

        setViewControllers([vc1, vc2], animated: true)
    }

}
