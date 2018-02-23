//
//  StringDecodingProcessor.swift
//  FlexibleNetworkLayer
//
//  Created by Isa Aliev on 23.02.18.
//  Copyright © 2018 IA. All rights reserved.
//

import Foundation

enum StringDecodingError: Error {
    case failedToDecodeString
}

class StringDecodingProcessor: ModelDecodingProcessor<String> {
    var encoding: String.Encoding = .utf8
    
    override func decodeFrom(_ data: Data) throws -> String {
        if let string = String(bytes: data, encoding: encoding) {
            return string
        }
        
        throw StringDecodingError.failedToDecodeString
    }
}
