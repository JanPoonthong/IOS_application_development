//
//  EachAppViewController.swift
//  App Store Top Chart App
//
//  Created by Jan Poonthong on 13/7/2567 BE.
//

import UIKit

class EachAppViewController: UIViewController {

    @IBOutlet weak var appName: UILabel!
    
    @IBOutlet weak var chart: UILabel!
    @IBOutlet weak var age: UILabel!
    @IBOutlet weak var rating: UILabel!
    
    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var shortDescription: UILabel!
    @IBOutlet weak var descrip: UILabel!
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var contentView: UIView!
    var detail: AppStore?


    override func viewDidLoad() {
        super.viewDidLoad()
        
        guard let detail = detail else { return }
                
        appName.text = detail.appName
        if let iconImage = UIImage(named: detail.appIcon) {
            image.image = iconImage
        }
        chart.text = "\(detail.topChartPosition)"
        age.text = detail.age
        rating.text = String(detail.rating)
        shortDescription.text = detail.shortDescription
        descrip.text = detail.detailedDescription
        
//        let scrollView = UIScrollView()
//                scrollView.translatesAutoresizingMaskIntoConstraints = false
//                view.addSubview(scrollView)
//
//                NSLayoutConstraint.activate([
//                    scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
//                    scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
//                    scrollView.topAnchor.constraint(equalTo: view.topAnchor),
//                    scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
//                ])
//        
//        let contentView = UIView()
//        contentView.translatesAutoresizingMaskIntoConstraints = false
//               scrollView.addSubview(contentView)
//
//               NSLayoutConstraint.activate([
//                   contentView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
//                   contentView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
//                   contentView.topAnchor.constraint(equalTo: scrollView.topAnchor),
//                   contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
//                   contentView.heightAnchor.constraint(equalTo: scrollView.heightAnchor)
//               ])
        
        var previousImageView: UIImageView?
        for imageName in detail.screenshotGallery {
                    let imageView = UIImageView(image: UIImage(named: imageName))
                    imageView.contentMode = .scaleAspectFit
                    imageView.translatesAutoresizingMaskIntoConstraints = false
                    contentView.addSubview(imageView)

                    NSLayoutConstraint.activate([
                        imageView.topAnchor.constraint(equalTo: contentView.topAnchor),
                        imageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
                        imageView.widthAnchor.constraint(equalToConstant: 200) // Set a specific width for each image
                    ])

                    if let previousImageView = previousImageView {
                        imageView.leadingAnchor.constraint(equalTo: previousImageView.trailingAnchor, constant: 10).isActive = true
                    } else {
                        imageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10).isActive = true
                    }
                    previousImageView = imageView
                }

                if let previousImageView = previousImageView {
                    previousImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10).isActive = true
                }
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
