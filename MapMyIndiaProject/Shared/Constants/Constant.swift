//
//  Constant.swift
//  MapMyIndiaProject
//
//  Created by Aman gupta on 16/05/19.
//  Copyright © 2019 Aman Gupta. All rights reserved.
//

import Foundation
import UIKit

// MARK: - Singlnton Objects
let kAppDelegate = UIApplication.shared.delegate as! AppDelegate
let kUserDefaults = UserDefaults.standard


// MARK : - Common Messgaes
let kAlert = "Alert"
let kOk = "Ok"
let kCancel = "Cancel"
let kAppTitle = "MapMyIndia Test"
let kHudDefaultText = "Please Wait..."
let kErrorMessage = "Something went wrong."

// MARK: - User Default Keys
enum UserDefaultKeys: String {
    case kUserData
}

// MARK: - Common API keys
enum APIKeys: String {
    case kAPIError = "error"
}
