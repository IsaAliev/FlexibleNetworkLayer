//
//  GitHubRepo.swift
//  FlexibleNetworkLayer
//
//  Created by Isa Aliev on 23.02.18.
//  Copyright © 2018 IA. All rights reserved.
//

import Foundation

struct GitHubRepo: Decodable {
    var id: Int
    var name: String
    var `private`: Bool
    var description: String
    var url: URL
    var hasIssues: Bool
    
    enum CodingKeys: String, CodingKey {
        case hasIssues = "has_issues"
        case id
        case name
        case `private`
        case description
        case url
    }
}
