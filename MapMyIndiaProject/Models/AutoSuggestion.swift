//
//  AutoSuggestion.swift
//  MapMyIndiaProject
//
//  Created by Aman gupta on 16/05/19.
//  Copyright © 2019 Aman Gupta. All rights reserved.
//

import Foundation
import UIKit

struct AutoSuggestion: Serializable {
    var suggestedLocations: [SuggestedLocations]?
    var suggestedSearches: [SuggestedSearches]?
    
    enum CodingKeys: String, CodingKey {
        case suggestedLocations = "suggestedLocations"
        case suggestedSearches = "suggestedSearches"
    }
    
}
