//
//  GETUsersLocationRequest.swift
//  FlexibleNetworkLayer
//
//  Created by Isa Aliev on 23.02.18.
//  Copyright © 2018 IA. All rights reserved.
//

import Foundation

struct GETUsersLocationRequest: HTTPGETRequest {
    var path: String = "https://api.github.com/users/"
    var parameters: JSON?
    var headerFields: [String: String]?
    
    init(_ userName: String) {
        path += userName
    }
}
