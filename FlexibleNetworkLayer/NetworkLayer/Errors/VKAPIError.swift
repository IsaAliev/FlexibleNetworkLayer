//
//  VKAPIError.swift
//  FlexibleNetworkLayer
//
//  Created by Isa Aliev on 25.02.18.
//  Copyright © 2018 IA. All rights reserved.
//

import Foundation

enum VKAPIErrorType: String, ErrorType {
    case invalidAccessToken
    case unknownError
}

struct VKAPIError: ErrorRepresentable {
    var errorCode: Int?
    var message: String?
    var type: ErrorType = VKAPIErrorType.unknownError
    
    init(_ type: ErrorType) {
        self.type = type
    }
    
    init(_ response: ResponseRepresentable) {
        guard let data = response.data else {
            return
        }
        
        let jsonSerializer = JSONSerializer()
        guard let dataJSON = try? jsonSerializer.serialize(data),
            let errorJSON = dataJSON["error"] as? JSON else {
            return
        }

        errorCode = errorJSON["error_code"] as? Int
        message = errorJSON["error_msg"] as? String
        
        guard let code = errorCode else {
            return
        }
        
        switch code {
        case 5:
            type = VKAPIErrorType.invalidAccessToken
        default:
            type = VKAPIErrorType.unknownError
        }
    }
}
