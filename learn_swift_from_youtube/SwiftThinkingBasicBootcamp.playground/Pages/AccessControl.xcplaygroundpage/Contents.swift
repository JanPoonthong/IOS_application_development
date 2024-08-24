import Foundation

struct MovieModel {
    let title: String
    let genre: MovieGenre
}

enum MovieGenre {
    case comedy, action, horror
}

class MovieManager {
    var movie1 = MovieModel(title: "Avatar", genre: .action)
}
