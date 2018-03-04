//
//  Data+String.swift
//  FlexibleNetworkLayer
//
//  Created by Isa Aliev on 04.03.18.
//  Copyright © 2018 IA. All rights reserved.
//

import Foundation

extension Data {
    mutating func append(_ string: String) {
        let data = string.data(using: .utf8, allowLossyConversion: false)
        append(data!)
    }
}
