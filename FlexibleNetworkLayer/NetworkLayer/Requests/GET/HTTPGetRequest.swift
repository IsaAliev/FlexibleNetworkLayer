//
//  HTTPGetRequest.swift
//  FlexibleNetworkLayer
//
//  Created by Isa Aliev on 21.02.2018.
//  Copyright © 2018 IA. All rights reserved.
//

import Foundation

protocol HTTPGetRequest: HTTPRequestRepresentable { }

extension HTTPGetRequest {
    var httpMethod: HTTPMethod {
        return .GET
    }
    
    var bodyString: String? {
        get {
            return nil
        }
        
        set {
            
        }
    }
}
