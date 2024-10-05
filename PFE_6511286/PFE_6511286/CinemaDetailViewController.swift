import UIKit

class CinemaDetailViewController: UIViewController {
    
    var cinema: Cinema? // Cinema data to display
    
    private let cinemaNameLabel = UILabel()
    private let zoneLabel = UILabel()
    private let imageView = UIImageView()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Set up the view
        view.backgroundColor = .white
        
        // Set up the UI
        setupUI()
        
        // Populate the UI with cinema data
        if let cinema = cinema {
            cinemaNameLabel.text = cinema.cinema_name_en
            zoneLabel.text = cinema.zone_name_en
            
            // Set image
            let cinemaNamesAndImages: [String: String] = [
                "Paragon Cineplex": "paragon",
                "Major Cineplex": "major",
                "Imax Laser": "imax",
                "Icon Cineconic": "icon",
                "Quartier Cineart": "emq"
            ]
            
            if let brandName = cinema.brand_name_en {
                imageView.image = UIImage(named: cinemaNamesAndImages[brandName] ?? "placeholder")
            }
        }
    }

    private func setupUI() {
        // Set up labels and image view
        cinemaNameLabel.translatesAutoresizingMaskIntoConstraints = false
        zoneLabel.translatesAutoresizingMaskIntoConstraints = false
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        
        view.addSubview(cinemaNameLabel)
        view.addSubview(zoneLabel)
        view.addSubview(imageView)

        // Add constraints
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            imageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            imageView.heightAnchor.constraint(equalToConstant: 200),
            imageView.widthAnchor.constraint(equalToConstant: 200),
            
            cinemaNameLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 20),
            cinemaNameLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            zoneLabel.topAnchor.constraint(equalTo: cinemaNameLabel.bottomAnchor, constant: 10),
            zoneLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }
}
