//
//  AddressTokens.swift
//  MapMyIndiaProject
//
//  Created by Aman gupta on 16/05/19.
//  Copyright © 2019 Aman Gupta. All rights reserved.
//

import Foundation
import UIKit

struct AddressTokens: Serializable {
    var houseNumber: String?
    var houseName: String?
    var poi: String?
    var street: String?
    var subSubLocality: String?
    var subLocality: String?
    var locality: String?
    var village: String?
    var subDistrict: String?
    var district: String?
    var city: String?
    var state: String?
    var pincode: String?
    
    enum CodingKeys: String, CodingKey {
        case houseNumber = "houseNumber"
        case houseName = "houseName"
        case poi = "poi"
        case street = "street"
        case subSubLocality = "subSubLocality"
        case subLocality = "subLocality"
        case locality = "locality"
        case village = "village"
        case subDistrict = "subDistrict"
        case district = "district"
        case city = "city"
        case state = "state"
        case pincode = "pincode"
    }
    
}
