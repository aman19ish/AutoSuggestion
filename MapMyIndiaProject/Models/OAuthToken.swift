//
//  OAuthToken.swift
//  MapMyIndiaProject
//
//  Created by Aman gupta on 17/05/19.
//  Copyright © 2019 Aman Gupta. All rights reserved.
//

import Foundation

struct OAuthToken: Serializable {
    var tokenType: String?
    var accessToken: String?
    var scope: String?
    var expiresIn: Int?
    
    enum CodingKeys: String, CodingKey {
        case tokenType = "token_type"
        case accessToken = "access_token"
        case scope = "scope"
        case expiresIn = "expires_in"
    }
    
}

