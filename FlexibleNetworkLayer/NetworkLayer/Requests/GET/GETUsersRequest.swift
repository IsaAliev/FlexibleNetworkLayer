//
//  GETUsersRequest.swift
//  FlexibleNetworkLayer
//
//  Created by Isa Aliev on 19.02.18.
//  Copyright © 2018 IA. All rights reserved.
//

import Foundation

struct GETUsersRequest: HTTPGETRequest {
    var path: String = "https://api.vk.com/method/users.get"
    var parameters: JSON? = ["user_ids": "212100336","fields":"online,screen_name,education" ]
    var headerFields: [String: String]?
}
