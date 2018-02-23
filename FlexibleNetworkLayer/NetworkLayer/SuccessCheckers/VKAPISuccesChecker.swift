//
//  VKAPISuccessChecker.swift
//  FlexibleNetworkLayer
//
//  Created by Isa Aliev on 20.02.2018.
//  Copyright © 2018 IA. All rights reserved.
//

import Foundation

struct VKAPISuccessChecker: SuccessResponseChecker {
    let jsonSerializer = JSONSerializer()
    
    func isSuccessResponse(_ response: ResponseRepresentable) -> Bool {
        guard let httpResponse = response.response as? HTTPURLResponse else {
            return false
        }
        
        let isSuccesAccordingToStatusCode = Range(uncheckedBounds: (200, 300)).contains(httpResponse.statusCode)
        
        guard let data = response.data else {
            return false
        }
        
        guard let json = try? jsonSerializer.serialize(data) else {
            return false
        }
        
        return isSuccesAccordingToStatusCode && !json.keys.contains("error")
    }
}
