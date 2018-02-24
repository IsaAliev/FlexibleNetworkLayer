//
//  GitHubUsersAPI.swift
//  FlexibleNetworkLayer
//
//  Created by Isa Aliev on 23.02.18.
//  Copyright © 2018 IA. All rights reserved.
//

import Foundation

protocol GitHubUsersAPI {
    func getLocationFor(_ user: String, completion: @escaping (String) -> ())
}
