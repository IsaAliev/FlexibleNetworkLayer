//
//  BaseSuccessResponseChecker.swift
//  FlexibleNetworkLayer
//
//  Created by Isa Aliev on 20.02.2018.
//  Copyright © 2018 IA. All rights reserved.
//

import Foundation

struct BaseSuccessResponseChecker: SuccessResponseChecker {
    func isSuccessResponse(_ response: ResponseRepresentable) -> Bool {
        guard let httpResponse = response.response as? HTTPURLResponse else {
            return false
        }
        
        return Range(uncheckedBounds: (200, 300)).contains(httpResponse.statusCode)
    }
}
