//
//  MarvelAPIBuilder.swift
//  FlexibleNetworkLayer
//
//  Created by Isa Aliev on 26.03.18.
//  Copyright © 2018 IA. All rights reserved.
//

import Foundation

struct MarvelAPIBuilder: APIBuilder {
    typealias ErrorType = BaseError
    
    func buildAPI<T>(_ responseType: T.Type, request: HTTPRequestRepresentable?, decodingProcessor: ModelDecodingProcessor<T>? = nil, nestedModelGetter: NestedModelGetter? = nil) -> BaseService<T, ErrorType>  {
        let service = BaseService<T, ErrorType>()
        service.request = request
        
        let responseHandler = HTTPResponseHandler<T, ErrorType>()
        responseHandler.nestedModelGetter = nestedModelGetter
        responseHandler.successResponseChecker = BaseSuccessResponseChecker()
        service.requestPreparator = MarvelRequestPreparator()
        
        if let decodingProcessor = decodingProcessor {
            responseHandler.decodingProcessor = decodingProcessor
        }
        
        service.responseHandler = responseHandler
        
        return service
    }
}
