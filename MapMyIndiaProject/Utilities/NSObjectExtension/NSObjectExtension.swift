//
//  NSObjectExtension.swift
//  MapMyIndiaProject
//
//  Created by Aman gupta on 16/05/19.
//  Copyright © 2019 Aman Gupta. All rights reserved.
//

import Foundation

// MARK : - NSObject Extension
extension NSObject {
    static func className() -> String {
        return String(describing : self)
    }
    
}
