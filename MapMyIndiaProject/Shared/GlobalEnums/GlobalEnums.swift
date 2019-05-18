//
//  GlobalEnums.swift
//  MapMyIndiaProject
//
//  Created by Aman gupta on 16/05/19.
//  Copyright © 2019 Aman Gupta. All rights reserved.
//

import Foundation

enum Storyboard: String {
    case main = "Main"
}

// MARK: - Error type
enum RequestStatus: Error {
    case noNetwork, requestSuccess, requestFailed, requestCancelled
}

// MARK: - Http Methods Type
public enum HTTPMethod: String {
    case get, post, put, patch, delete
}
