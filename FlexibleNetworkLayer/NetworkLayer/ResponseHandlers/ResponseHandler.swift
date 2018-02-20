//
//  ResponseHandler.swift
//  FlexibleNetworkLayer
//
//  Created by Isa Aliev on 19.02.18.
//  Copyright © 2018 IA. All rights reserved.
//

import Foundation

typealias JSON = [String: Any]

enum Result {
    case JSONValue(JSON)
    case StringValue(String)
    case Error(ErrorRepresentable)
    case None
}

protocol ResponseHandler {
    func handleResponse(_ response: ResponseRepresentable, completion: (Result) -> ())
}
