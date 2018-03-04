//
//  GETWallRequest.swift
//  FlexibleNetworkLayer
//
//  Created by Isa Aliev on 20.02.18.
//  Copyright © 2018 IA. All rights reserved.
//

import Foundation

struct WallRouter {
    struct GET: HTTPGETRequest {
        var path: String = APIStrings.BaseURL.vk + "wall.get"
        var parameters: JSON? = [:]
        var headerFields: [String: String]?
        
        init(_ ownerID: String, count: Int) {
            parameters?["owner_id"] = ownerID
            parameters?["count"] = count
        }
    }
    
    struct POST: HTTPPOSTRequest {
        var path: String = APIStrings.BaseURL.vk + "wall.post"
        var parameters: JSON? = [:]
        var headerFields: [String: String]?
        var body: Data?
        
        init(message: String) {
            parameters?["message"] = message
        }
    }
}
