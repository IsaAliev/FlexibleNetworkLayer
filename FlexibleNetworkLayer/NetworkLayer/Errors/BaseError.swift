//
//  BaseError.swift
//  FlexibleNetworkLayer
//
//  Created by Isa Aliev on 19.02.18.
//  Copyright © 2018 IA. All rights reserved.
//

import Foundation

enum BaseErrorType: String, ErrorType {
    case fatalError
}

struct BaseError: ErrorRepresentable {
    var errorCode: Int?
    var message: String?
    var type: ErrorType
    
    init(_ response: ResponseRepresentable) {
        errorCode = 0
        message = ""
        type = BaseErrorType.fatalError
    }
}
