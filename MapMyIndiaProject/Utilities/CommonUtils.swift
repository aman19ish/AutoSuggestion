//
//  CommonUtils.swift
//  MapMyIndiaProject
//
//  Created by Aman gupta on 17/05/19.
//  Copyright © 2019 Aman Gupta. All rights reserved.
//

import Foundation
import UIKit

class CommonUtils {
    
    // MARK: - Debug logs
    class func debug_logs(arg: Any) {
        #if DEBUG
        print(arg)
        #endif
    }

    //Get Current logged in user access token
    class func getCurrentAccessToken() -> OAuthToken? {
        if let data = UserDefaults.standard.object(forKey: UserDefaultKeys.kUserData.rawValue) as? Data {
            let decoder = JSONDecoder()
            let userModel = try? decoder.decode(OAuthToken.self, from: data)
            return userModel
        }
        return nil
    }
    
    class func setCurrentAccessToken(model: OAuthToken?) {
        if let data = model?.serialize() {
            UserDefaults.standard.set(data, forKey: UserDefaultKeys.kUserData.rawValue)
        }
        UserDefaults.standard.synchronize()
    }
    
    //Get dictionary from network data
    class func getDictionaryFromData(data: Data) -> [String: Any]? {
        do {
            let responseData = try JSONSerialization.jsonObject(with: data,
                                                                options: JSONSerialization.ReadingOptions.allowFragments) as? [String: Any]
            return responseData
        } catch let error {
            CommonUtils.debug_logs(arg: "json error: \(error.localizedDescription)")
            return nil
        }
    }
    
}
