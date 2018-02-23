//
//  POSTWallRequest.swift
//  FlexibleNetworkLayer
//
//  Created by Isa Aliev on 22.02.18.
//  Copyright © 2018 IA. All rights reserved.
//

import Foundation

struct POSTWallRequest: HTTPRequestRepresentable {
    var path: String = "https://api.vk.com/method/wall.post"
    var parameters: JSON? = ["message": "test message"]
    var headerFields: [String: String]?
    var httpMethod: HTTPMethod {
        return .POST
    }
    var bodyString: String? = nil
}
