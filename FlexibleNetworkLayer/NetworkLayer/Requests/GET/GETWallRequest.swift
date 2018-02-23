//
//  GETWallRequest.swift
//  FlexibleNetworkLayer
//
//  Created by Isa Aliev on 20.02.18.
//  Copyright © 2018 IA. All rights reserved.
//

import Foundation

struct GETWallRequest: HTTPGETRequest {
    var path: String = "https://api.vk.com/method/wall.get"
    var parameters: JSON? = ["owner_id": "-86529522","count": 20]
    var headerFields: [String: String]? 
}
