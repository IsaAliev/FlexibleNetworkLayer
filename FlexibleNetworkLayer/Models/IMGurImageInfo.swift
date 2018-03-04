//
//  IMGurImageInfo.swift
//  FlexibleNetworkLayer
//
//  Created by Isa Aliev on 03.03.18.
//  Copyright © 2018 IA. All rights reserved.
//

import Foundation

struct IMGurImageInfo: Decodable {
    var link: URL
    var views: Int
    var title: String?
    var description: String?
}
