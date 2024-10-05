import UIKit

class CinemaCell: UITableViewCell {
    
    var cinemaImageView: UIImageView!
    var cinemaNameLabel: UILabel!
    var zoneLabel: UILabel!
    var favoriteButton: UIButton!
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViews() {
        // Initialize the cinema image view
        cinemaImageView = UIImageView()
        cinemaImageView.contentMode = .scaleAspectFit
        cinemaImageView.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(cinemaImageView)
        
        // Initialize the cinema name label
        cinemaNameLabel = UILabel()
        cinemaNameLabel.translatesAutoresizingMaskIntoConstraints = false
        cinemaNameLabel.font = UIFont.boldSystemFont(ofSize: 16)
        contentView.addSubview(cinemaNameLabel)
        
        // Initialize the zone label
        zoneLabel = UILabel()
        zoneLabel.translatesAutoresizingMaskIntoConstraints = false
        zoneLabel.font = UIFont.systemFont(ofSize: 14)
        contentView.addSubview(zoneLabel)
        
        // Initialize the favorite button
        favoriteButton = UIButton(type: .system)
        favoriteButton.setImage(UIImage(systemName: "star"), for: .normal) // Use system star image
        favoriteButton.setImage(UIImage(systemName: "star.fill"), for: .selected) // Filled star for selected state
        favoriteButton.translatesAutoresizingMaskIntoConstraints = false
        favoriteButton.addTarget(self, action: #selector(favoriteButtonTapped), for: .touchUpInside)
        contentView.addSubview(favoriteButton)
        
        // Set up constraints
        NSLayoutConstraint.activate([
            // Constraints for cinemaImageView
            cinemaImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 8),
            cinemaImageView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            cinemaImageView.widthAnchor.constraint(equalToConstant: 100),
            cinemaImageView.heightAnchor.constraint(equalToConstant: 100),
            
            // Constraints for cinemaNameLabel
            cinemaNameLabel.leadingAnchor.constraint(equalTo: cinemaImageView.trailingAnchor, constant: 8),
            cinemaNameLabel.trailingAnchor.constraint(equalTo: favoriteButton.leadingAnchor, constant: -8),
            cinemaNameLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8),
            
            // Constraints for zoneLabel
            zoneLabel.leadingAnchor.constraint(equalTo: cinemaImageView.trailingAnchor, constant: 8),
            zoneLabel.trailingAnchor.constraint(equalTo: favoriteButton.leadingAnchor, constant: -8),
            zoneLabel.topAnchor.constraint(equalTo: cinemaNameLabel.bottomAnchor, constant: 4),
            
            // Constraints for favoriteButton
            favoriteButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -8),
            favoriteButton.centerYAnchor.constraint(equalTo: contentView.centerYAnchor)
        ])
    }
    
    @objc private func favoriteButtonTapped() {
        favoriteButton.isSelected.toggle() // Toggle the selected state
        // Handle favorite logic (e.g., save to favorites)
    }
}
