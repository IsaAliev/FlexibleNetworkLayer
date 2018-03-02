//
//  HTTPResponseHandler.swift
//  FlexibleNetworkLayer
//
//  Created by Isa Aliev on 19.02.18.
//  Copyright © 2018 IA. All rights reserved.
//

import Foundation

class HTTPResponseHandler<T: Decodable, E: ErrorRepresentable>: ResponseHandler {
    typealias ResultType = T
    typealias ErrorType = E
    
    private var isResponseRepresentSimpleType: Bool {
        return
            T.self == Int.self ||
            T.self == String.self ||
            T.self == Double.self ||
            T.self == Float.self
    }
    
    var errorHandler: ErrorHandler = BaseErrorHandler()
    var successResponseChecker: SuccessResponseChecker = BaseSuccessResponseChecker()
    var decodingProcessor = ModelDecodingProcessor<T>()
    var nestedModelGetter: NestedModelGetter?
    
    func handleResponse(_ response: ResponseRepresentable, completion: (Result<T, E>) -> ()) {
        if successResponseChecker.isSuccessResponse(response) {
            processSuccessResponse(response, completion: completion)
        } else {
            processFailureResponse(response, completion: completion)
        }
    }
    
    private func processSuccessResponse(_ response: ResponseRepresentable, completion: (Result<T, E>) -> ()) {
        guard var data = response.data else {
            return
        }

        if let nestedModelGetter = nestedModelGetter {
            if let escapedModelJSON = try? nestedModelGetter.getFrom(data) {
                if isResponseRepresentSimpleType {
                    if let result = simpleTypeUsingNestedModelGetter(from: data) {
                        completion(.Value(result))
                        return
                    }
                    
                    completion(Result.Error(E(ProcessingErrorType.modelProcessingError)))
                    return
                    
                } else {
                    guard let model = escapedModelJSON[nestedModelGetter.escapedModelKey],
                        model is JSON || model is [JSON],
                        let serializedData = try? JSONSerialization.data(withJSONObject: model, options: [])
                        else {
                            completion(Result.Error(E(ProcessingErrorType.modelProcessingError)))
                            return
                    }
                    
                    data = serializedData
                }
            }
        }

        guard let result = try? decodingProcessor.decodeFrom(data) else {
            completion(Result.Error(E(ProcessingErrorType.modelProcessingError)))
            
            return
        }
        
        completion(.Value(result))
    }
    
    private func simpleTypeUsingNestedModelGetter(from data: Data) -> T? {
        let getter = nestedModelGetter!
        
        guard let escapedModelJSON = try? getter.getFrom(data) else {
            return nil
        }
        
        guard let result = escapedModelJSON[getter.escapedModelKey] as? T else {
            return nil
        }
        
        return result
    }
    
    
    private func processFailureResponse(_ response: ResponseRepresentable, completion: (Result<T, E>) -> ()) {
        let error = E(response)
        completion(.Error(error))
        errorHandler.handleError(error)
    }
}
