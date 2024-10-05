import UIKit
import Kingfisher

class ViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    var movies: [Movie] = [] // Array to hold the movie data
    var filteredMovies: [Movie] = [] // Array to hold filtered movie data based on selection
    var collectionView: UICollectionView!
    var segmentedControl: UISegmentedControl!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Set the large title
        title = "Minor Cineplex"
        
        // Enable large titles
        navigationController?.navigationBar.prefersLargeTitles = true
        setupSegmentedControl()
        setupCollectionView()
        fetchMovies()
    }
    
    private func setupSegmentedControl() {
        // Create the segmented control
        segmentedControl = UISegmentedControl(items: ["Now Showing", "Upcoming"])
        segmentedControl.selectedSegmentIndex = 0 // Default to "Now Showing"
        segmentedControl.addTarget(self, action: #selector(segmentedControlChanged), for: .valueChanged)

        // Set the frame or use constraints
        segmentedControl.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(segmentedControl)
        
        // Add constraints for the segmented control
        NSLayoutConstraint.activate([
            segmentedControl.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 16),
            segmentedControl.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            segmentedControl.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16)
        ])
    }
    
    private func setupCollectionView() {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.minimumInteritemSpacing = 10 // Space between items
        layout.minimumLineSpacing = 10 // Space between lines
        
        let itemWidth = (view.frame.width / 2) - 15 // Two items in a row with spacing
        layout.itemSize = CGSize(width: itemWidth, height: 250) // Adjust height as needed
        
        collectionView = UICollectionView(frame: CGRect.zero, collectionViewLayout: layout)
        collectionView.register(MovieCell.self, forCellWithReuseIdentifier: "movieCell")
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.backgroundColor = .white
        
        view.addSubview(collectionView)
        
        // Add constraints for the collection view
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: segmentedControl.bottomAnchor, constant: 16),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    
    private func fetchMovies() {
        APICaller.shared.fetchMovie { [weak self] result in
            switch result {
            case .success(let movies):
                self?.movies = movies
                self?.filteredMovies = movies // Initially show all movies
                DispatchQueue.main.async {
                    self?.collectionView.reloadData() // Reload collection view with the fetched movies
                }
            case .failure(let error):
                print("Error fetching movies: \(error.localizedDescription)")
            }
        }
    }

    @objc private func segmentedControlChanged(_ sender: UISegmentedControl) {
        // Handle the change in the segmented control
        switch sender.selectedSegmentIndex {
        case 0:
            print("Now Showing selected")
            // Filter movies for "Now Showing"
            filteredMovies = movies.filter { $0.now_showing == "1" } // Now showing if now_showing is "1"
        case 1:
            print("Upcoming selected")
            // Filter movies for "Upcoming"
            filteredMovies = movies.filter { $0.now_showing == "" } 
        default:
            break
        }
        // Reload the collection view to show the updated data
        collectionView.reloadData()
    }


    // MARK: - UICollectionViewDataSource

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return filteredMovies.count // Use filtered movies count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "movieCell", for: indexPath) as! MovieCell
        
        let movie = filteredMovies[indexPath.item] // Use filtered movies array
        
        // Use Kingfisher to load the image from the URL
        if let posterURL = URL(string: movie.poster_url ?? "") {
            cell.posterImageView.kf.setImage(with: posterURL, placeholder: UIImage(named: "placeholder")) // Use a placeholder image if needed
        } else {
            cell.posterImageView.image = UIImage(named: "placeholder") // Set a placeholder image if the URL is invalid
        }
        
        cell.titleLabel.text = movie.title_en
        cell.releaseDateLabel.text = movie.release_date
        cell.genreLabel.text = movie.genre
        
        return cell
    }

    // MARK: - UICollectionViewDelegateFlowLayout

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = (view.frame.width / 2) - 15 // Two items in a row with spacing
        return CGSize(width: width, height: 250) // Adjust height as needed
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
         let selectedMovie = filteredMovies[indexPath.item] // Get the selected movie
         
         // Instantiate the detail view controller
         let detailVC = MovieDetailViewController()
         detailVC.movie = selectedMovie // Pass the selected movie
         
         // Set the modal presentation style
         detailVC.modalPresentationStyle = .pageSheet // Or .formSheet for a smaller size
         
         // Present the detail view controller modally
         present(detailVC, animated: true, completion: nil)
     }
}
