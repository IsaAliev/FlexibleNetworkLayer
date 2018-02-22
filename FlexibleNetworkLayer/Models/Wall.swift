//
//  Wall.swift
//  FlexibleNetworkLayer
//
//  Created by Isa Aliev on 20.02.18.
//  Copyright © 2018 IA. All rights reserved.
//

import Foundation

struct Wall: Decodable {
    var items: [WallItem]
    
    enum CodingKeys: String, CodingKey {
        case items = "items"
    }
}
