//
//  GitHubNestedModelGetter.swift
//  FlexibleNetworkLayer
//
//  Created by Isa Aliev on 23.02.18.
//  Copyright © 2018 IA. All rights reserved.
//

import Foundation

enum GitHubNestedModelGetter: String, NestedModelGetter {
    case usersLocation = "location"
    
    var keyPath: String {
        return self.rawValue
    }
}
