//
//  Room.swift
//  TourBooking
//
//  Created by Dmitry Gorbunow on 12/19/23.
//

import Foundation

struct Room: Decodable {
    let rooms: [RoomElement]
}

struct RoomElement: Decodable {
    let id: Int
    let name: String
    let price: Int
    let pricePer: String
    let peculiarities: [String]
    let imageUrls: [String]

    enum CodingKeys: String, CodingKey {
        case id, name, price
        case pricePer = "price_per"
        case peculiarities
        case imageUrls = "image_urls"
    }
}
