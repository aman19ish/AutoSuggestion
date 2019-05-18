//
//  SuggestedSearches.swift
//  MapMyIndiaProject
//
//  Created by Aman gupta on 16/05/19.
//  Copyright © 2019 Aman Gupta. All rights reserved.
//

import Foundation
import UIKit

struct SuggestedSearches: Serializable {
    var keyword: String?
    var identifier: String?
    var location: String?
    var hyperLink: String?
    var orderIndex: String?
    
    enum CodingKeys: String, CodingKey {
        case keyword = "keyword"
        case identifier = "identifier"
        case location = "location"
        case hyperLink = "hyperLink"
        case orderIndex = "orderIndex"
    }
}

