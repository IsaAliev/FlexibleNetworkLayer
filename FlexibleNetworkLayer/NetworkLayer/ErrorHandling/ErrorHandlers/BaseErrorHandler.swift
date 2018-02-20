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
    var errorCodeGetter: ErrorCodeGetter = BaseErrorCodeGetter()
    var errorMessageGetter: ErrorMessageGetter = BaseErrorMessageGetter()
    
    func handleErrorResponse(_ response: ResponseRepresentable, completion: (ErrorRepresentable) -> ()) {
        guard let httpResponse = response.response as? HTTPURLResponse else {
            return
        }
        
        var errorMessage: String?
        var errorCode = httpResponse.statusCode
        
        if let data = response.data {
            errorMessage = errorMessageGetter.messageFromErrorData(data)
            errorCode = errorCodeGetter.errorCodeFrom(response)
        }
        
        let error = BaseError(errorCode: errorCode, message: errorMessage)
        errorCodeHandler.handleError(with: errorCode)
        
        completion(error)
    }
}
