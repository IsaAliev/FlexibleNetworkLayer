//
//  GETReposRequest.swift
//  FlexibleNetworkLayer
//
//  Created by Isa Aliev on 23.02.18.
//  Copyright © 2018 IA. All rights reserved.
//

import Foundation

struct GETReposRequest: HTTPGETRequest {
    var path: String = "https://api.github.com/orgs/octokit/repos"
    var parameters: JSON?
    var headerFields: [String: String]?
}
