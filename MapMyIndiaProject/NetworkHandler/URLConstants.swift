//
//  URLConstants.swift
//  MapMyIndiaProject
//
//  Created by Aman gupta on 17/05/19.
//  Copyright © 2019 Aman Gupta. All rights reserved.
//

import Foundation

struct APPURL {
    
    private  static let baseURLAcessToken = "https://outpost.mapmyindia.com/api/"
    private  static let baseURL = "https://atlas.mapmyindia.com/api/"
    
    static var securityOauthToken: String {
        return baseURLAcessToken + "security/oauth/token"
    }

    static var autoSearch: String {
        return baseURL + "places/search/json?query=%@"
    }
    
}
