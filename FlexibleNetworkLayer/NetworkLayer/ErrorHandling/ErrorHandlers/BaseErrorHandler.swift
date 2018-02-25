//
//  BaseErrorHandler.swift
//  FlexibleNetworkLayer
//
//  Created by Isa Aliev on 20.02.2018.
//  Copyright © 2018 IA. All rights reserved.
//

import Foundation

struct BaseErrorHandler: ErrorHandler {
    var errorCodeHandler: ErrorCodeHandler = BaseErrorCodeHandler()
    
    func handleError(_ error: ErrorRepresentable) {
        print("Hadled error with message: \(error.message)")
    }
}
