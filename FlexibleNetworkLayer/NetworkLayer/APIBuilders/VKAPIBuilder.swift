//
//  VKAPIBuilder.swift
//  FlexibleNetworkLayer
//
//  Created by Isa Aliev on 23.02.18.
//  Copyright © 2018 IA. All rights reserved.
//

import Foundation

class VKAPIBuilder<T: Decodable>: APIBuilder {
    typealias ResultType = T
    
    func buildAPI(for request: HTTPRequestRepresentable,
             decodingProcessor: ModelDecodingProcessor<T>? = nil,
             nestedModelGetter: NestedModelGetter? = nil) -> BaseService<T> {
        let service = BaseService<T>()
        service.request = request
        
        let responseHandler = HTTPResponseHandler<T>()
        responseHandler.nestedModelGetter = nestedModelGetter
        responseHandler.successResponseChecker = VKAPISuccessChecker()
        responseHandler.errorHandler.errorMessageGetter = VKAPIErrorMessageGetter()
        responseHandler.errorHandler.errorCodeGetter = VKAPIErrorCodeGetter()
        
        if let decodingProcessor = decodingProcessor {
            responseHandler.decodingProcessor = decodingProcessor
        }
        
        service.responseHandler = responseHandler
        
        return service
    }
}
