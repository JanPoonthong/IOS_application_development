//
//  RestaurantInfo.swift
//  PME-6511286
//
//  Created by Jan Poonthong on 27/7/2567 BE.
//

import Foundation

struct Restaurant: Codable {
    let name: String
    let location: String
    let description: String
    let rating: Double
    let openingTime: String
    let price: String
    let images: [String]
}

struct Restaurants: Codable {
    let restaurants: [Restaurant]
    
    enum CodingKeys: String, CodingKey {
        case restaurants = "items"
    }
}
