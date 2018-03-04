//
//  VKAPIBuilder.swift
//  FlexibleNetworkLayer
//
//  Created by Isa Aliev on 23.02.18.
//  Copyright © 2018 IA. All rights reserved.
//

import Foundation

class VKAPIBuilder: APIBuilder {
    typealias ErrorType = VKAPIError
    
    func buildAPI<T>(_ responseType: T.Type, request: HTTPRequestRepresentable? = nil,
             decodingProcessor: ModelDecodingProcessor<T>? = nil,
             nestedModelGetter: NestedModelGetter? = nil) -> BaseService<T, ErrorType> {
        let service = BaseService<T, ErrorType>()
        service.request = request
        
        let responseHandler = HTTPResponseHandler<T, ErrorType>()
        responseHandler.nestedModelGetter = nestedModelGetter
        responseHandler.successResponseChecker = VKAPISuccessChecker()
        service.requestPreparator = VKAPIRequestPreparator()
        
        if let decodingProcessor = decodingProcessor {
            responseHandler.decodingProcessor = decodingProcessor
        }
        
        service.responseHandler = responseHandler
        
        return service
    }
}

