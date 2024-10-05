import Alamofire

struct MoviesResponse: Decodable {
    let movies: [Movie]
}

struct Movie: Decodable {
    let title_en: String?
    let release_date: String?
    let genre: String?
    let poster_url: String?
    let now_showing: String?
    let tr_mp4: String?
}

struct CinemasResponse: Decodable {
    let cinemas: [Cinema]
}

struct Cinema: Decodable {
    let cinema_name_en: String?
    let zone_name_en: String?
    let brand_name_en: String?
}

class APICaller {
    
    static let shared = APICaller()
    
    // Fetch movies from the API
    func fetchMovie(completion: @escaping (Result<[Movie], Error>) -> Void) {
        let url = "https://majorcineplex.com/apis/get_movie_avaiable"
        
        // Decode the response as MoviesResponse
        AF.request(url, method: .get).responseDecodable(of: MoviesResponse.self) { response in
            switch response.result {
            case .success(let moviesResponse):
                // Pass the movies array from the response
                completion(.success(moviesResponse.movies))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
    
    func fetchCinema(completion: @escaping (Result<[Cinema], Error>) -> Void) {
        let url = "https://majorcineplex.com/apis/get_cinema"
        
        AF.request(url, method: .get).responseDecodable(of: CinemasResponse.self) { response in
            switch response.result {
            case .success(let cinemasResponse):
                completion(.success(cinemasResponse.cinemas))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}
