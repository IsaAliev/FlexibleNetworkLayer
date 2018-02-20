//
//  VKAPISuccesChecker.swift
//  FlexibleNetworkLayer
//
//  Created by Isa Aliev on 20.02.2018.
//  Copyright © 2018 IA. All rights reserved.
//

import Foundation

struct VKAPISuccesChecker: SuccessResponseChecker {
    let jsonSerializer = JSONSerializer()
    
    func isSuccesResponse(_ response: ResponseRepresentable) -> Bool {
        guard let data = response.data else {
            return false
        }
        
        guard let json = try? jsonSerializer.serialize(data) else {
            return false
        }
        
        return !json.keys.contains("error")
    }
}
