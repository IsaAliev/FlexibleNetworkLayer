//
//  VKAPIErrorCodeGetter.swift
//  FlexibleNetworkLayer
//
//  Created by Isa Aliev on 20.02.2018.
//  Copyright © 2018 IA. All rights reserved.
//

import Foundation

struct VKAPIErrorCodeGetter: ErrorCodeGetter {
    let serializer = JSONSerializer()
    
    func errorCodeFrom(_ response: ResponseRepresentable) -> Int {
        guard let data = response.data else {
            return 0
        }
        
        guard let json = try? serializer.serialize(data) else {
            return 0
        }
        
        return (json["error"] as! JSON)["error_code"] as? Int ?? 0
    }
}
