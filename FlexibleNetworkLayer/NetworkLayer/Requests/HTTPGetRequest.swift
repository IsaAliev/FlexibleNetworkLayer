//
//  HTTPGetRequest.swift
//  FlexibleNetworkLayer
//
//  Created by Isa Aliev on 21.02.2018.
//  Copyright © 2018 IA. All rights reserved.
//

import Foundation

protocol HTTPGETRequest: HTTPRequestRepresentable { }

extension HTTPGETRequest {
    var httpMethod: HTTPMethod {
        return .GET
    }
    
    var body: Data? {
        get {
            return nil
        }
        
        set {
            
        }
    }
}
