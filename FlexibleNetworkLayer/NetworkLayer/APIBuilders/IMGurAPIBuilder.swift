//
//  IMGurAPIBuilder.swift
//  FlexibleNetworkLayer
//
//  Created by Isa Aliev on 03.03.18.
//  Copyright © 2018 IA. All rights reserved.
//

import Foundation

struct IMGurAPIBuilder: APIBuilder {
    typealias ErrorType = BaseError
    
    func buildAPI<T>(_ responseType: T.Type, request: HTTPRequestRepresentable?, decodingProcessor: ModelDecodingProcessor<T>? = nil, nestedModelGetter: NestedModelGetter? = nil) -> BaseService<T, IMGurAPIBuilder.ErrorType>  {
        let service = BaseService<T, ErrorType>()
        service.request = request
        
        let responseHandler = HTTPResponseHandler<T, ErrorType>()
        responseHandler.nestedModelGetter = nestedModelGetter
        responseHandler.successResponseChecker = BaseSuccessResponseChecker()
        service.requestPreparator = IMGurRequestPreparator()
        
        if let decodingProcessor = decodingProcessor {
            responseHandler.decodingProcessor = decodingProcessor
        }
        
        service.responseHandler = responseHandler
        
        return service
    }
}
