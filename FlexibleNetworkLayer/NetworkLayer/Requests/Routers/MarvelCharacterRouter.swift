//
//  MarvelCharacterRouter.swift
//  FlexibleNetworkLayer
//
//  Created by Isa Aliev on 26.03.18.
//  Copyright © 2018 IA. All rights reserved.
//

import Foundation

struct MarvelCharacterRouter {
    class GET: PagedRequest<MarvelCharactersList> {
        override var path: String {
            return APIStrings.BaseURL.marvel + "characters"
        }
        
        override init() {
            super.init()
            
            parameters?["limit"] = 10
            parameters?["offset"] = 0
        }
        
        override func prepareForNext(with response: MarvelCharactersList) {
            parameters?["offset"] = response.offset + 10
        }
        
        override func resetToStart() {
            parameters?["offset"] = 0
        }
    }
}
