//
//  APIBuilder.swift
//  FlexibleNetworkLayer
//
//  Created by Isa Aliev on 23.02.18.
//  Copyright © 2018 IA. All rights reserved.
//

import Foundation

protocol APIBuilder {
    associatedtype ErrorType: ErrorRepresentable
    
    func buildAPI<T>(_ responseType: T.Type, request: HTTPRequestRepresentable?,
                                decodingProcessor: ModelDecodingProcessor<T>?,
                                nestedModelGetter: NestedModelGetter? ) -> BaseService<T, ErrorType>
}
