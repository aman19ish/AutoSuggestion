//
//  SearchManager.swift
//  MapMyIndiaProject
//
//  Created by Aman gupta on 17/05/19.
//  Copyright © 2019 Aman Gupta. All rights reserved.
//

import Foundation
import UIKit

class SearchManager {

    // MARK: - Shared Instance
    static let sharedInstance = SearchManager()
    
    // MARK: - Private Init
    private init() {}
    
    // MARK: - Fetch Acccess Token
    func fetchAccessToken(params: [String: Any], completionClosure: @escaping (_ success: Bool, _ errorMsg: String?, _ model: OAuthToken?) -> Void) {
        NetworkHandler.sharedInstance.requestApi(serviceUrl: APPURL.securityOauthToken, method: .post, postData: params, withProgressHUD: true) { (data, error, errorType, statusCode) in
            if errorType == .requestSuccess {
                switch statusCode {
                case 200, 201:
                    let decoder = JSONDecoder()
                    if let responseData = data {
                        do {
                            let model = try decoder.decode(OAuthToken.self, from: responseData)
                            completionClosure(true, nil, model)
                        } catch {
                            CommonUtils.debug_logs(arg: error.localizedDescription)
                            completionClosure(false, error.localizedDescription, nil)
                        }
                    }
                default:
                    var errorMessage: String? = kErrorMessage
                    if let responseData = data,
                        let responseDict = CommonUtils.getDictionaryFromData(data: responseData),
                        let errorDict = responseDict[APIKeys.kAPIError.rawValue] as? String {
                        errorMessage = errorDict
                    }
                    completionClosure(false, errorMessage ?? kErrorMessage, nil)
                    break
                }
            }
        }
        
    }
    
    // MARK: - Fetch Audo suggestion data
    func fetchAutoSuggestion(url: String, completionClosure: @escaping (_ success: Bool, _ errorMsg: String?, _ model: AutoSuggestion?) -> Void) {
        NetworkHandler.sharedInstance.requestApi(serviceUrl: url, method: .get, postData: [:], withProgressHUD: true) { (data, error, errorType, statusCode) in
            if errorType == .requestSuccess {
                switch statusCode {
                case 200, 201:
                    let decoder = JSONDecoder()
                    if let responseData = data {
                        do {
                            let model = try decoder.decode(AutoSuggestion.self, from: responseData)
                            completionClosure(true, nil, model)
                        } catch {
                            CommonUtils.debug_logs(arg: error.localizedDescription)
                            completionClosure(false, error.localizedDescription, nil)
                        }
                    }
                default:
                    completionClosure(false, kErrorMessage, nil)
                    break
                }
            }
        }
    }
    
}
