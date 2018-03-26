//
//  TodoItem.swift
//  FlexibleNetworkLayer
//
//  Created by Isa Aliev on 10.03.18.
//  Copyright © 2018 IA. All rights reserved.
//

import Foundation

struct TodoItem: Decodable {
    var id: String
    var description: String
    var completed: String
}
