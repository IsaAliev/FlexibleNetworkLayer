//
//  GETUsersRequest.swift
//  FlexibleNetworkLayer
//
//  Created by Isa Aliev on 19.02.18.
//  Copyright © 2018 IA. All rights reserved.
//

import Foundation

struct UsersRouter {
    enum UserFields: String {
        case online
        case screenName = "screen_name"
        case education
        case hidden
    }
    
    struct GET: HTTPGETRequest {        
        var path: String {
            return APIStrings.BaseURL.vk + "users.get"
        }
        var parameters: JSON? = [:]
        var headerFields: [String: String]?
        
        init(_ userIDs: [String], fields: [UserFields]) {
            parameters?["user_ids"] = userIDs.joined(separator: ",")
            parameters?["fields"] = fields.map({ $0.rawValue }).joined(separator: ",")
        }
    }
}
