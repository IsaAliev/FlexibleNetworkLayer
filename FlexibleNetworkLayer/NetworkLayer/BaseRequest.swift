//
//  BaseRequest.swift
//  FlexibleNetworkLayer
//
//  Created by Isa Aliev on 19.02.18.
//  Copyright © 2018 IA. All rights reserved.
//

import Foundation
//https://api.vk.com/method
struct BaseRequest: RequestRepresentable {
    var path: String = "https://api.vk.com/method/users.get"
    var HTTPMethod: String = "GET"
    var parameters: JSON? = ["user_ids": "00213", "v": "5.73"]
}
