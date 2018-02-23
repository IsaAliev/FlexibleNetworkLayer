//
//  APIBuilder.swift
//  FlexibleNetworkLayer
//
//  Created by Isa Aliev on 23.02.18.
//  Copyright © 2018 IA. All rights reserved.
//

import Foundation

protocol APIBuilder {
    associatedtype ResultType: Decodable
    
    func buildAPI(for request: HTTPRequestRepresentable,
    decodingProcessor: ModelDecodingProcessor<ResultType>?,
    nestedModelGetter: NestedModelGetter?) -> BaseService<ResultType>
}
