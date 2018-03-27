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
        let limit = 100
        
        override var path: String {
            return APIStrings.BaseURL.marvel + "characters"
        }
        
        override init() {
            super.init()
            
            parameters?["limit"] = limit
            parameters?["offset"] = 1300
        }
        
        override func prepareForNext(with response: MarvelCharactersList) {
            let newOffset = response.offset + limit
            parameters?["offset"] = newOffset
            isPagesDidEnd = response.offset + response.results.count >= response.total
        }
        
        override func resetToStart() {
            parameters?["offset"] = 0
        }
    }
}
