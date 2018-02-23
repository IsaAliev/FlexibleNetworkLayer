//
//  WallGettable.swift
//  FlexibleNetworkLayer
//
//  Created by Isa Aliev on 23.02.18.
//  Copyright © 2018 IA. All rights reserved.
//

import Foundation

protocol WallGettable {
    func getWall(completion: @escaping (Wall) -> ())
}

protocol WallPostable {
    func postWall(with message: String)
}

typealias WallAPI = WallGettable & WallPostable

