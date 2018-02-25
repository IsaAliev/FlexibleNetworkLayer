//
//  Service.swift
//  FlexibleNetworkLayer
//
//  Created by Isa Aliev on 19.02.18.
//  Copyright © 2018 IA. All rights reserved.
//

import Foundation

protocol Service {
    associatedtype ResultType: Decodable
    associatedtype ErrorType: ErrorRepresentable
    
    typealias SuccessHandlerBlock = (ResultType) -> ()
    typealias FailureHandlerBlock = (ErrorType) -> ()
    
    var request: HTTPRequestRepresentable? { get set }
    var responseHandler: HTTPResponseHandler<ResultType, ErrorType>? { get set }
  
    func sendRequest() -> Self?
}
