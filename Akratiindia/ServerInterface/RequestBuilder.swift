//
//  RequestBuilder.swift
//  Akratiindia
//
//  Created by Pulkit Rohilla on 5/27/17.
//  Copyright © 2017 Pulkit Rohilla. All rights reserved.
//

import UIKit

class RequestBuilder: NSObject {

    let timeOutInterval = 60.0
    
    func returnServerString() -> String{
        
        let serverString = "35.154.200.140"
        
        return serverString
    }
    
    func returnAuthenticationRequest(email: String, password: String) -> NSURLRequest {
        
        let urlString = "\(returnServerString())\(WebserviceURL().LoginWebservice)"
        let request : NSMutableURLRequest = NSMutableURLRequest.init(url: URL.init(string: urlString)!, cachePolicy: .reloadIgnoringCacheData, timeoutInterval: timeOutInterval)
        request.setValue("Application/json", forKey: "Content-type")
        request.setValue("onyourown", forKey: "access_code")
        request.setValue("ios", forKey: "realm")
        
        let jsonDict = ["user": ["email": email,
                                 "password": password]]
        
        let jsonData = try? JSONSerialization.data(withJSONObject: jsonDict, options: .prettyPrinted)
        
        request.httpMethod = "POST"
        request.httpBody = jsonData
        
        return request
        
    }
}
