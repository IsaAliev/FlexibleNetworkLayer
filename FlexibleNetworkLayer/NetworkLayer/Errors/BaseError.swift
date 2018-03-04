//
//  BaseError.swift
//  FlexibleNetworkLayer
//
//  Created by Isa Aliev on 19.02.18.
//  Copyright © 2018 IA. All rights reserved.
//

import Foundation

enum BaseErrorType: Int, ErrorType {
    case fatalError = 500
    case authorizationRequired = 401
    case unknown = 0
}

struct BaseError: ErrorRepresentable {
    var errorCode: Int?
    var message: String?
    var type: ErrorType
    
    init(_ type: ErrorType) {
        self.type = type
    }
    
    init(_ response: ResponseRepresentable) {
        errorCode = (response.response as? HTTPURLResponse)?.statusCode
        message = ""
        type = BaseErrorType(rawValue: errorCode ?? 0) ?? .unknown
    }
}
