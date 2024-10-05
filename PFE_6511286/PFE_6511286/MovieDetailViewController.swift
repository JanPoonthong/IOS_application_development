import UIKit
import Kingfisher
import AVKit
import AVFoundation
import Alamofire

class MovieDetailViewController: UIViewController {
    
    var movie: Movie! // Property to hold the selected movie
    private let posterImageView = UIImageView()
    private let titleLabel = UILabel()
    private let releaseDateLabel = UILabel()
    private let genreLabel = UILabel()
    private let playButton = UIButton()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        setupUI() // Setup the UI elements
        configureUI() // Configure the UI with movie data
    }

    private func setupUI() {
        // Add and configure UI elements here
        posterImageView.contentMode = .scaleAspectFit
        titleLabel.font = UIFont.boldSystemFont(ofSize: 24)
        releaseDateLabel.font = UIFont.systemFont(ofSize: 16)
        genreLabel.font = UIFont.systemFont(ofSize: 16)

        // Set the text colors
        titleLabel.textColor = .black
        releaseDateLabel.textColor = .darkGray
        genreLabel.textColor = .darkGray

        let stackView = UIStackView(arrangedSubviews: [posterImageView, titleLabel, releaseDateLabel, genreLabel, playButton])
        stackView.axis = .vertical
        stackView.spacing = 10
        stackView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(stackView)

        // Add constraints to the stack view
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 16),
            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            
            // Set the height of the poster image view
            posterImageView.heightAnchor.constraint(equalToConstant: 250) // Adjust as needed
        ])

        // Setup play button
        playButton.setTitle("Play Trailer", for: .normal)
        playButton.setTitleColor(.white, for: .normal)
        playButton.backgroundColor = .blue // Change to your preferred color
        playButton.layer.cornerRadius = 5
        playButton.addTarget(self, action: #selector(playTrailer), for: .touchUpInside)

        // Add constraints for the play button
        playButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            playButton.heightAnchor.constraint(equalToConstant: 50) // Adjust height as needed
        ])
    }

    private func configureUI() {
        if let posterURL = URL(string: movie.poster_url ?? "") {
            posterImageView.kf.setImage(with: posterURL, placeholder: UIImage(named: "placeholder"))
        }
        titleLabel.text = movie.title_en
        releaseDateLabel.text = movie.release_date
        genreLabel.text = movie.genre
    }
    
    @objc private func playTrailer() {
        // Use the movie's tr_mp4 property for the trailer URL
        guard let trailerURLString = movie.tr_mp4, let url = URL(string: trailerURLString) else {
            print("Trailer URL is invalid or not available.")
            return
        }
        
        let player = AVPlayer(url: url)
        let playerViewController = AVPlayerViewController()
        playerViewController.player = player
        
        // Present the player view controller
        present(playerViewController, animated: true) {
            player.play() // Start playing the video
        }
    }
}
