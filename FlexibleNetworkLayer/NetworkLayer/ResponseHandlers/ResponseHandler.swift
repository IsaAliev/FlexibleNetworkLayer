//
//  ResponseHandler.swift
//  FlexibleNetworkLayer
//
//  Created by Isa Aliev on 19.02.18.
//  Copyright © 2018 IA. All rights reserved.
//

import Foundation

typealias JSON = [String: Any]

enum Result<T, E> {
    case Value(T)
    case Error(E)
}

protocol ResponseHandler {
    associatedtype ResultType
    associatedtype ErrorType
    
    func handleResponse(_ response: ResponseRepresentable, completion: (Result<ResultType, ErrorType>) -> ())
}
