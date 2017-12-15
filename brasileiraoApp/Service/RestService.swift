//
//  RestService.swift
//  brasileiraoApp
//
//  Created by Pedro Nascimento on 15/12/2017.
//  Copyright © 2017 Pedro Nascimento. All rights reserved.
//

import Foundation
import Alamofire

class RestServices {
    
    private class func getCompleteUrl(forKey key: String) -> String {
        if let path = Bundle.main.path(forResource: "RestEndpoints", ofType: "plist") {
            let dictionary = NSDictionary(contentsOfFile: path)
            let serverUrl = dictionary?.value(forKey: Constants.ServerKeys.server) as! String

            return serverUrl + (dictionary?.value(forKey: key) as! String)
        }
        
        return ""
    }
    
    class func buscarCampeonato() {
        Alamofire.request(getCompleteUrl(forKey: Constants.ServerKeys.partidas)).responseJSON { response in
            debugPrint(response)
            
            if let json = response.result.value {
                print("JSON: \(json)")
            }
        }
    }
    
}
