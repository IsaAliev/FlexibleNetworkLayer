//
//  MarvelCharactersList.swift
//  FlexibleNetworkLayer
//
//  Created by Isa Aliev on 26.03.18.
//  Copyright © 2018 IA. All rights reserved.
//

import Foundation

struct MarvelCharactersList: Decodable {
    var results: [MarvelCharacter]
    var offset: Int
    var total: Int
}
