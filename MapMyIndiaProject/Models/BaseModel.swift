//
//  BaseModel.swift
//  MapMyIndiaProject
//
//  Created by Aman gupta on 18/05/19.
//  Copyright © 2019 Aman Gupta. All rights reserved.
//

import Foundation

//Serializable protocol which has a method that convert model into data so that it can be stored in userdefault

protocol Serializable: Codable {
    func serialize() -> Data?
    func getDictionary() -> [String: Any]?
}

extension Serializable {
    
    func serialize() -> Data? {
        let encoder = JSONEncoder()
        return try? encoder.encode(self)
    }
    
    func getDictionary() -> [String: Any]? {
        if let data = self.serialize() {
            do {
                let dict = try JSONSerialization.jsonObject(with: data,
                                                            options: JSONSerialization.ReadingOptions.mutableContainers) as? [String: Any]
                return dict
            } catch {
                return nil
            }
        }
        return nil
    }
    
}
