import UIKit
import Alamofire

class CinemasViewController: UIViewController {
    
    var tableView: UITableView!
    var cinemas: [Cinema] = []
    var filteredCinemas: [Cinema] = [] // Array for filtered cinemas
    var isShowingFavorites: Bool = false // Track if favorites are being shown
    var segmentedControl: UISegmentedControl!
    
    // Array to store favorite cinema names (assuming Cinema has a `cinema_name` property)
    var favoriteCinemaNames: [String] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Set up the navigation title
        title = "Cinemas"
        
        navigationController?.navigationBar.prefersLargeTitles = true
        
        // Set up the segmented control
        setupSegmentedControl()
        
        // Initialize and set up the table view
        tableView = UITableView(frame: .zero, style: .plain)
        tableView.register(CinemaCell.self, forCellReuseIdentifier: "cinemaCell")
        tableView.dataSource = self
        tableView.delegate = self
        tableView.translatesAutoresizingMaskIntoConstraints = false // Enable Auto Layout
        view.addSubview(tableView)
        
        // Set up constraints for the table view
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: segmentedControl.bottomAnchor, constant: 10), // Below the segmented control
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor) // Fill the view
        ])
        
        // Fetch cinema data
        fetchCinemas()
    }

    private func setupSegmentedControl() {
        // Create the segmented control with two segments
        segmentedControl = UISegmentedControl(items: ["All Cinemas", "Favorites"])
        segmentedControl.selectedSegmentIndex = 0 // Default to "All Cinemas"
        segmentedControl.addTarget(self, action: #selector(segmentedControlChanged(_:)), for: .valueChanged)
        
        // Add the segmented control to the view and set constraints
        segmentedControl.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(segmentedControl)
        
        // Set constraints to position it correctly
        NSLayoutConstraint.activate([
            segmentedControl.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
            segmentedControl.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            segmentedControl.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            segmentedControl.heightAnchor.constraint(equalToConstant: 40) // Adjust height as needed
        ])
    }

    @objc private func segmentedControlChanged(_ sender: UISegmentedControl) {
        isShowingFavorites = sender.selectedSegmentIndex == 1 // Update based on selected segment
        updateFilteredCinemas() // Update the filtered cinemas
    }
    
    private func updateFilteredCinemas() {
        if isShowingFavorites {
            // Filter the cinemas for favorites
            filteredCinemas = cinemas.filter { favoriteCinemaNames.contains($0.cinema_name_en ?? "") }
        } else {
            filteredCinemas = cinemas // Show all cinemas
        }
        tableView.reloadData() // Reload the table view with the updated data
    }
    
    func fetchCinemas() {
        APICaller.shared.fetchCinema { [weak self] result in
            switch result {
            case .success(let cinemas):
                self?.cinemas = cinemas
                DispatchQueue.main.async {
                    self?.updateFilteredCinemas() // Update the filtered cinemas after fetching
                }
            case .failure(let error):
                print("Error fetching cinemas: \(error)")
            }
        }
    }
}

// MARK: - UITableViewDataSource and UITableViewDelegate
extension CinemasViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return isShowingFavorites ? filteredCinemas.count : cinemas.count // Return filtered count based on selection
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cinemaCell", for: indexPath) as! CinemaCell
        let cinema = isShowingFavorites ? filteredCinemas[indexPath.row] : cinemas[indexPath.row] // Use filtered or all cinemas
        
        // List of cinema names and corresponding images
        let cinemaNamesAndImages: [String: String] = [
            "Paragon Cineplex": "paragon",
            "Major Cineplex": "major",
            "Imax Laser": "imax",
            "Icon Cineconic": "icon",
            "Quartier Cineart": "emq"
        ]
        
        // Initialize a variable to hold the image name
        var imageName: String?
        
        // Check if the cinema brand name matches any of the specified names
        if let brandName = cinema.brand_name_en {
            if let matchedImageName = cinemaNamesAndImages[brandName] {
                imageName = matchedImageName
            }
        }
        
        // Set the image in the cell
        if let imageName = imageName {
            cell.cinemaImageView.image = UIImage(named: imageName) // Set the corresponding image
        } else {
            cell.cinemaImageView.image = UIImage(named: "placeholder") // Set a placeholder if no match is found
        }
        
        // Set cinema name
        cell.cinemaNameLabel.text = cinema.cinema_name_en ?? "N/A"
        
        // Set zone name
        cell.zoneLabel.text = cinema.zone_name_en
        
        // Configure the favorite button based on the favorites array
        let isFavorite = favoriteCinemaNames.contains(cinema.cinema_name_en ?? "") // Check if the cinema is a favorite
        cell.favoriteButton.isSelected = isFavorite
        
        // Add action for the favorite button
        cell.favoriteButton.addTarget(self, action: #selector(favoriteButtonTapped(_:)), for: .touchUpInside)
        cell.favoriteButton.tag = indexPath.row // Set the tag to identify the cinema in the action method
        
        return cell
    }
    
    @objc private func favoriteButtonTapped(_ sender: UIButton) {
        let cinema = isShowingFavorites ? filteredCinemas[sender.tag] : cinemas[sender.tag]
        
        // Check if cinema name is valid
        guard let cinemaName = cinema.cinema_name_en else { return }
        
        if let index = favoriteCinemaNames.firstIndex(of: cinemaName) {
            // If it's already a favorite, remove it
            favoriteCinemaNames.remove(at: index)
        } else {
            // If it's not a favorite, add it
            favoriteCinemaNames.append(cinemaName)
        }
        
        // Update the filtered cinemas
        updateFilteredCinemas()
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // Deselect the cell
        tableView.deselectRow(at: indexPath, animated: true)
        
        // Get the selected cinema
        let selectedCinema = isShowingFavorites ? filteredCinemas[indexPath.row] : cinemas[indexPath.row]
        
        // Instantiate the detail view controller
        let detailVC = CinemaDetailViewController()
        detailVC.cinema = selectedCinema // Pass the selected cinema
        
        // Set the modal presentation style
        detailVC.modalPresentationStyle = .pageSheet // Or .formSheet for a smaller size
        
        // Present the detail view controller modally
        present(detailVC, animated: true, completion: nil)
    }
}
