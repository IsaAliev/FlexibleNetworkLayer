//
//  WallGettable.swift
//  FlexibleNetworkLayer
//
//  Created by Isa Aliev on 23.02.18.
//  Copyright © 2018 IA. All rights reserved.
//

import Foundation

protocol WallGettable {
    func getWall(fromOwnerWith id: String, completion: @escaping (Wall) -> ())
    func getWallItemsCount(fromOwnerWith id: String, completion: @escaping (Int) -> ())
}

protocol WallPostable {
    func postWall(with message: String)
}

typealias WallAPI = WallGettable & WallPostable

