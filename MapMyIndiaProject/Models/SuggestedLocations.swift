//
//  SuggestedLocations.swift
//  MapMyIndiaProject
//
//  Created by Aman gupta on 16/05/19.
//  Copyright © 2019 Aman Gupta. All rights reserved.
//

import Foundation
import UIKit

struct SuggestedLocations: Serializable {
    var type: String?
    var typeX: Int?
    var placeAddress: String?
    var latitude: Double?
    var longitude: Double?
    var eLoc: String?
    var entryLatitude: Double?
    var entryLongitude: Double?
    var placeName: String?
    var alternateName: String?
    var keywords: [String]?
    var addressTokens: AddressTokens?
    var p: Int?
    var orderIndex: Int?

    enum CodingKeys: String, CodingKey {
        case type = "type"
        case typeX = "typeX"
        case placeAddress = "placeAddress"
        case latitude = "latitude"
        case longitude = "longitude"
        case eLoc = "eLoc"
        case entryLatitude = "entryLatitude"
        case entryLongitude = "entryLongitude"
        case placeName = "placeName"
        case alternateName = "alternateName"
        case keywords = "keywords"
        case addressTokens = "addressTokens"
        case p = "p"
        case orderIndex = "orderIndex"
    }
}
