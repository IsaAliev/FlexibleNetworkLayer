//
//  HTTPResponseHandler.swift
//  FlexibleNetworkLayer
//
//  Created by Isa Aliev on 19.02.18.
//  Copyright © 2018 IA. All rights reserved.
//

import Foundation

class HTTPResponseHandler<T: Decodable>: ResponseHandler {
    typealias ResultValueType = T
    
    var jsonSerializer = JSONSerializer()
    var stringSerializer = StringSerializer()
    var errorHandler: ErrorHandler = BaseErrorHandler()
    var successResponseChecker: SuccessResponseChecker = BaseSuccessResponseChecker()
    var decodingProcessor = DecodableModelDecodingProcessor<T>()
    
    func handleResponse(_ response: ResponseRepresentable, completion: (Result<T>) -> ()) {
        if successResponseChecker.isSuccessResponse(response) {
            processSuccessResponse(response, completion: completion)
        } else {
            processFailureResponse(response, completion: completion)
        }
    }
    
    private func processSuccessResponse(_ response: ResponseRepresentable, completion: (Result<T>) -> ()) {
        guard let data = response.data else {
            return
        }

        guard let result = try? decodingProcessor.decodeFrom(data) else {
            completion(.None)
            return
        }
        
        completion(.Value(result))
    }
    
    private func processFailureResponse(_ response: ResponseRepresentable, completion: (Result<T>) -> ()) {
        errorHandler.handleErrorResponse(response) { (error) in
            completion(.Error(error))
        }
    }
}

