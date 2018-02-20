//
//  UsersList.swift
//  FlexibleNetworkLayer
//
//  Created by Isa Aliev on 20.02.18.
//  Copyright © 2018 IA. All rights reserved.
//

import Foundation

struct UsersList: Decodable {
    var users: [User]
    
    enum CodingKeys: String, CodingKey {
        case users = "response"
    }
}
