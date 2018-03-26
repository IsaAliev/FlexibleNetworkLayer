//
//  PagedRequest.swift
//  FlexibleNetworkLayer
//
//  Created by Isa Aliev on 26.03.18.
//  Copyright © 2018 IA. All rights reserved.
//

import Foundation

class PagedRequest<T: Decodable>: HTTPGETRequest {
    var path: String {
        return ""
    }
    
    var parameters: JSON? = [String: Any]()
    var headerFields: [String : String]?
    
    func prepareForNext(with response: T) {
        
    }
    
    func resetToStart() {
        
    }
}
