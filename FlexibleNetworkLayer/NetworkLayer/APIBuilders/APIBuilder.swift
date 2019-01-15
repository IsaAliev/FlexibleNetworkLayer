//
//  APIBuilder.swift
//  FlexibleNetworkLayer
//
//  Created by Isa Aliev on 23.02.18.
//  Copyright © 2018 IA. All rights reserved.
//

import Foundation

class APIBuilder<T: Decodable, E: ErrorRepresentable> {
    var service = BaseService<T, E>()
    
    func setLoger(_ loger: Loger) -> Self {
        service.loger = loger
        
        return self
    }
    
    func setHeadersHandler(_ handler: HeadersHandler) -> Self {
        service.responseHandler?.headersHandler = handler
        
        return self
    }
    
    func setRequestPreparator(_ preparator: RequestPreparator) -> Self {
        service.requestPreparator = preparator
        
        return self
    }
    
    func setNestedModelGetter(_ modelGetter: NestedModelGetter) -> Self {
        service.responseHandler?.nestedModelGetter = modelGetter
        
        return self
    }
    
    func setSuccessResponseChecker(_ responseChecker: SuccessResponseChecker) -> Self {
        service.responseHandler?.successResponseChecker = responseChecker
        
        return self
    }
    
    func setRequest(_ request: HTTPRequestRepresentable) -> Self {
        service.request = request
        
        return self
    }
    
    func build(for responseType: T.Type, andDecodingProcessor processor: ModelDecodingProcessor<T>? = nil) -> BaseService<T, E> {
        if let processor = processor  {
            service.responseHandler?.decodingProcessor = processor
        }
        
        return service
    }
}
