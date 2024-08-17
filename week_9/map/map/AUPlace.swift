//
//  Location.swift
//  map
//
//  Created by Jan Poonthong on 17/8/2567 BE.
//

struct AUPlaceClass: Codable {
    let locations: [AUPlace]

    enum CodingKeys: String, CodingKey {
        case locations = "Places"
    }
}

struct AUPlace: Codable {
    let FacultyName: String
    let Abbreviation: String
    let ImageLogoName: String
    let LocationLat: Double
    let LocationLong: Double
    

    enum CodingKeys: String, CodingKey {
        case FacultyName = "FacultyName"
        case Abbreviation = "Abbreviation"
        case ImageLogoName = "ImageLogoName"
        case LocationLat = "LocationLat"
        case LocationLong = "LocationLong"
    }
}
