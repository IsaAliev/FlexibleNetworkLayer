//
//  HTTPPOSTRequest.swift
//  FlexibleNetworkLayer
//
//  Created by Isa Aliev on 23.02.18.
//  Copyright © 2018 IA. All rights reserved.
//

import Foundation

protocol HTTPPOSTRequest: HTTPRequestRepresentable { }

extension HTTPPOSTRequest {
    var httpMethod: HTTPMethod {
        return .POST
    }
    
    var bodyString: String? {
        get {
            return nil
        }
        
        set {
            
        }
    }
}
