//
//  ResponseModelGetter.swift
//  FlexibleNetworkLayer
//
//  Created by Isa Aliev on 22.02.18.
//  Copyright © 2018 IA. All rights reserved.
//

import Foundation

enum ResponseModelGetter: String, NestedModelGetter {
    case wallResponse = "response"
    case wallResponseItems = "response.items"
    case wallResponseCount = "response.count"
    case wallResponseFirstText = "response.items.text"
    
    var keyPath: String {
        return self.rawValue
    }
}
